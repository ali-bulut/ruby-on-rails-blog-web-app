module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    # we defined default page title and we use this in application.html.erb that is our main layout. Every single
    # html page is derived from application.html.erb
    @page_title = "Blog App | Ali Bulut"
  end
end