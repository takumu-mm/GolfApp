class Video < ApplicationRecord
  has_many :category_videos, dependent: :destroy
  has_many :categories, through: :category_videos
end
