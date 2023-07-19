class LikesController < ApplicationController

    before_action :authenticate_user!

    def create
        @car = CarProfile.find params[:car_profile_id]
        @comment = @car.comments.find params[:comment_id]
        @like = Like.new(comment: @comment, user: current_user)
        @like.save
        redirect_to car_profile_path(@car)
    end

    def destroy
        @like = Like.find params[:id]
        authorize! :destroy, @like
        @like.destroy
        redirect_to  car_profile_path params[:car_profile_id]
    end

end
