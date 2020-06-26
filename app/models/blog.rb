class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  # by writing this we are banning that adding a new blog or editing an existing blog without title and body text.
  validates_presence_of :title, :body

  # by writing this we say ruby that every blog has a topic.
  # so we can reach the topic of the first blog by using this => Blog.first.topic
  belongs_to :topic
end
