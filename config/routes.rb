Rails.application.routes.draw do
  # by writing this we are changing the path (we use /login instead of user/sign_in, /register instead of user/sign_up)
  # if we would write something in path we would reach /something/login
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  # when we use specific route for all of the operations such as delete, patch, post, get...,  we should use
  # resources. But if we have simple pages for only showing (like about or contact pages) we can simply use get.

  # that means use default routes for portfolios except show route.
  # we can add custom routes by using do end block. Here we created a new put route which name is sort(we should define
  # as sort also in controller.)
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  # so we can create a custom route for show. as => we can set the prefix(route method) of show route.
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'

  # if we want to reach about page by writing directly (localhost:3000/about instead of localhost:3000/pages/about)
  #get 'pages/about'
  # we can use this. We use # instead of /
  get 'about', to: 'pages#about'

  # if we want to react contact page by writing localhost:3000/contact-me
  #get 'pages/contact'
  # we can use this. So basically we can write anything we want for routing.
  get 'contact-me', to: 'pages#contact'


  # we can add custom routes into current routes like this.
  # and we can reach by writing toggle_status_blog_path/url
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  # we can define root path of app like this. We use # instead of /
  root to: 'pages#home'
end
