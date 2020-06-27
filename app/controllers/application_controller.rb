class ApplicationController < ActionController::Base
  include DeviseWhitelist
  # we defined session data in application_controller because application_controller is the parent. And the others'
  # coming from here. So if we define anything here, we can access wherever we want in the whole project.
  # and we should not write the whole code here. We should separate codes into different modules.
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = BulutViewTool::Renderer.copyright("Ali Bulut", "All rights reserved")
  end
end

module BulutViewTool
  class Renderer
    def self.copyright(name,msg)
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end