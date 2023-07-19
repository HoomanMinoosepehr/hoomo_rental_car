class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :car_profile

  validates :user_id, uniqueness: { scope: :car_profile_id }
end
