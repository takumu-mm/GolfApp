class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shared_video
  belongs_to :video

  validates :body, presence: true, length: { maximum: 1000 }
end
