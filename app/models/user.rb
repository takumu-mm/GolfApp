class User < ApplicationRecord
  has_one :profile
  has_many :shared_videos
  has_many :comments
  has_many :shared_videos, through: :shared_videos, source: :video
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false, unless: lambda { |user|
                                                                                   user.id.present? && user == User.find_by(email: user.email)
                                                                                 } }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def own?(object)
    id == object&.user_id
  end

  def self.ransackable_attributes(_auth_object = nil)
    ["name"]
  end
end
