class Skill < ApplicationRecord
  # we created a helper module(called as concern) in concerns folder in order to create images from one place.
  # so we can reach this module like this.
  include Placeholder
  validates_presence_of :title, :percent_utilized

  after_initialize :set_defaults

  def set_defaults
    self.badge ||= Placeholder.image_generator(250,250)
  end
end
