class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true
  has_one_attached :photo
end
