class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :car_profile

  has_many :likes, dependent: :destroy

  # for having all the likes of each comment
  has_many :likers, through: :likes, source: :comment

end
