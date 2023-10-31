class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    # checking if the user is logged in
    def authenticate_user!
        unless user_signed_in?
            flash[:danger] = "You need to sign in first!"
            redirect_to session_new_path
        end
    end
    
    # checking if the user has confirmed their email
    def email_confirmed!
        unless current_user.confirmed_email
            redirect_to send_path
        end
    end

    
    rescue_from CanCan::AccessDenied do |exception|
        flash[:danger] = "Access Denied!"
        redirect_to root_path
    end


    private

    def user_signed_in?
        current_user.present?
    end
    helper_method :user_signed_in?

    def current_user
        current_user ||= User.find_by_id session[:user_id]
    end
    helper_method :current_user

    # checking if the user has liked the specific comment
    def user_liked_comment(comment)
        current_user.likes.find_by(comment_id: comment.id)
    end
    helper_method :user_liked_comment

    # finding all the cars which the user has favorited
    def user_favorited_car(car)
        current_user.favorites.find_by(car_profile_id: car.id)
    end
    helper_method :user_favorited_car

    
    
end
