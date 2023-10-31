class User < ApplicationRecord

    has_secure_password

    has_many :CarProfiles, dependent: :destroy

    has_many :comments, dependent: :destroy

    has_many :favorites, dependent: :destroy
    has_many :favorated_cars, through: :favorites, source: :car_profile

    has_many :likes, dependent: :destroy
    has_many :liked_comments, through: :likes, source: :user

    validates :first_name, presence: true
    validates :last_name, presence: true

    # password validating, shoudld be valid and in an email format
    validates :email, uniqueness:{case_sensitive: false} , format: { with:/^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true }

    # the password should have at least 8 characters
    validates :password, length: { minimum: 8, message: 'Password needs to have at least 8 characters.' }
    
    # the passord shoulf have at least one number and one uppercase letter
    validates_format_of :password, with: /\A(?=.*[A-Z])(?=.*[1-9])/, message: 'Password needs to have at least one number and one uppercase letter in its body.' 

    # creating and saving the user's full name while creating the user account
    def full_name
        first_name.capitalize + ' ' + last_name.capitalize
    end

end
