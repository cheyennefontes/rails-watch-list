class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :list
  has_one_attached :photo
  validates :comment, length: { minimum: 6 }
end
