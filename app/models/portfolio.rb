class Portfolio < ApplicationRecord
  has_many :techologies, dependent: :destroy
  # we can add that into portfolio by writing =>
  # Portfolio.create!(title="dgsd", body:"sfgs", techologies_attributes: [{name:"Ruby"}, {name:"Rails"}, {name:"React"}])
  # after that query, we will have one more portolio, and 3 more technologies. That means if we write bottom code
  # we can create new techologies inside of the Portfolio query.
  # that means => do not accept technologies if name attr of technology is empty (this is just a validation.)
  accepts_nested_attributes_for :techologies, reject_if: lambda { |attrs| attrs["name"].blank? }
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: "Angular")
  end

  def self.by_position
    order("position ASC")
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
    self.main_image ||= Placeholder.image_generator(600,400)
    self.thumb_image ||= Placeholder.image_generator(350,200)
  end
end