class ApplicationController < ActionController::Base
  include DeviseWhitelist

  before_action :set_source

  def set_source
    # we can write anything we want instead of source, not important. We can reach session data
    # by searching source keyword.
    session[:source] = params[:q] if params[:q]
  end
end
