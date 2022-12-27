class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :list
  has_many :comments
  validates :comment, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list }
end
