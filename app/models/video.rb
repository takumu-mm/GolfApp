class Video < ApplicationRecord
  has_many :category_videos, dependent: :destroy
  has_many :categories, through: :category_videos
  has_many :shared_videos
  has_many :users, through: :shared_videos
  has_many :comments
end
