module DeviseWhitelist
  extend ActiveSupport::Concern

  # in order to write before_action method we should use included. That is given us by ActiveSupport.
  included do
    # it's doing same thing with before_action only difference is that we can choose which controller can reach that.
    # so here we say if the controller is devise controller lets it reach.
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    # that is special for devise.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end