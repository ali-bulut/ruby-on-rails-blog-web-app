class ApplicationController < ActionController::Base

  # it's doing same thing with before_action only difference is that we can choose which controller can reach that.
  # so here we say if the controller is devise controller lets it reach.
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name])
  end
end
