class User < ApplicationRecord

    has_secure_password

    has_many :CarProfiles, dependent: :destroy

    has_many :comments, dependent: :destroy

    has_many :favorites, dependent: :destroy
    has_many :favorated_cars, through: :favorites, source: :car_profile

    has_many :likes, dependent: :destroy
    has_many :liked_comments, through: :likes, source: :user

    validates :email, uniqueness: { message: 'This Email address is already used.' }
    validates :password, length: { minimum: 8, message: 'Password needs to have at least 8 characters.' }
    validates_format_of :password, with: /\A(?=.*[A-Z])(?=.*[1-9])/, message: 'Password needs to have at least one number and one uppercase letter in its body.' 

    def full_name
        first_name.capitalize + ' ' + last_name.capitalize
    end

end
