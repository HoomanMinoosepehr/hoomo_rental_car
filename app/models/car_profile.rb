class CarProfile < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favoraters, through: :favorites, source: :user

  has_one_attached :image

  validates :location, presence: true
end
