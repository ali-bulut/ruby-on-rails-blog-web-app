Rails.application.routes.draw do
  # when we use specific route for all of the operations such as delete, patch, post, get...,  we should use
  # resources. But if we have simple pages for only showing (like about or contact pages) we can simply use get.

  # that means use default routes for portfolios except show route.
  resources :portfolios, except: [:show]
  # so we can create a custom route for show. as => we can set the prefix(route method) of show route.
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # if we want to reach about page by writing directly (localhost:3000/about instead of localhost:3000/pages/about)
  #get 'pages/about'
  # we can use this. We use # instead of /
  get 'about', to: 'pages#about'

  # if we want to react contact page by writing localhost:3000/contact-me
  #get 'pages/contact'
  # we can use this. So basically we can write anything we want for routing.
  get 'contact-me', to: 'pages#contact'


  resources :blogs

  # we can define root path of app like this. We use # instead of /
  root to: 'pages#home'
end
