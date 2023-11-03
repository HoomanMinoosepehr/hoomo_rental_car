class CarProfile < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favoraters, through: :favorites, source: :user

  # attaching images to car profiles
  has_many_attached :image

  validates :location, presence: true
  validates :model, length: { minimum: 8 }
  validates :price, presence: true
end
