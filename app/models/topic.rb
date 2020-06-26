class Topic < ApplicationRecord
  validates_presence_of :title

  # by writing this we say ruby that every topic has multiple blogs.
  # so we can reach a list of blogs inside of first topic by using this => Topic.first.blogs
  has_many :blogs
end
