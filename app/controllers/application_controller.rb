class ApplicationController < ActionController::Base
  include DeviseWhitelist
  # we defined session data in application_controller because application_controller is the parent. And the others'
  # coming from here. So if we define anything here, we can access wherever we want in the whole project.
  # and we should not write the whole code here. We should separate codes into different modules.
  include SetSource
  include CurrentUserConcern


end
