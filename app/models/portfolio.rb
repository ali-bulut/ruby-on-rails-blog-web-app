class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: "Angular")
  end

  # both of them are same. And we can reach from controller in a same way.
  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: "Ruby on Rails")}
end