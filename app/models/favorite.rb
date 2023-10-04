class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :car_profile

  # the combination of the user id and car profile id should be unique (user can only favorite a car once)
  validates :user_id, uniqueness: { scope: :car_profile_id }
end
