class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: "Angular")
  end

  # both of them are same. And we can reach from controller in a same way.
  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: "Ruby on Rails")}

  # that means => after 'new'(not create!) method in controller works, the portfolio form will be created.
  # So after form created, this method will run.
  after_initialize :set_defaults

  def set_defaults
    # ||= => self.main_image = "https://via.placeholder.com/600x400" if main_image == nil
    # ||= => that means if you have already a main_image or thumb_image I dont override them.
    # but if you use = instead, that means when we have already an main_image or thumb_image,
    # ruby will not care about that and it will override that.
    self.main_image ||= "https://via.placeholder.com/600x400"
    self.thumb_image ||= "https://via.placeholder.com/350x200"
  end
end