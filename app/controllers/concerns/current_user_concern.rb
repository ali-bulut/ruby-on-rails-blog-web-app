module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    # by using this we are able to create a new object for User model. Here we are ovveriding the current_user method
    # which is coming from devise. And down here we are calling super and if there is no user who logged in
    # it will be false and so OpenStruct will create a new user model for us. We can compare them by using is_a?
    # if there is a user who logged in it means current_user.class will be User but if there is no any user who logged
    # in it will be OpenStruct.
    # that architecture is called as null object pattern.
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User",
                   first_name: "Guest",
                   last_name: "User",
                   email: "guest@user.com"
    )
  end
end