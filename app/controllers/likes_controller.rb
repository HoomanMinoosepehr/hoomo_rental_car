class LikesController < ApplicationController

    before_action :authenticate_user!
    before_action :email_confirmed!

    def create
        @car = CarProfile.find params[:car_profile_id]
        @comment = @car.comments.find params[:comment_id]
        @like = Like.new(comment: @comment, user: current_user)
        @like.save
        redirect_to car_profile_path(@car)
    end

    def destroy
        @like = Like.find params[:id]
        # checking if the user is authorized to delete the like
        authorize! :destroy, @like
        @like.destroy
        redirect_to  car_profile_path params[:car_profile_id]
    end

end
