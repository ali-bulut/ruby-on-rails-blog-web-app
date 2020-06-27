module SetSource
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  def set_source
    # we can write anything we want instead of source, not important. We can reach session data
    # by searching source keyword.
    session[:source] = params[:q] if params[:q]
  end
end