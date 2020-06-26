class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  # by writing this we are banning that adding a new blog or editing an existing blog without title and body text.
  validates_presence_of :title, :body
end
