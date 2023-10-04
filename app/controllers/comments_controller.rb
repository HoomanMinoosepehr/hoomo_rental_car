class CommentsController < ApplicationController

    before_action :authenticate_user!
    before_action :email_confirmed!

    def create
        @car = CarProfile.find_by_id params[:car_profile_id]
        @comment = Comment.new(content: params[:content])
        @comment.user = current_user
        @comment.car_profile = @car
        if @comment.save
            redirect_to car_profile_path(@car)
        else
            flash[:danger] = "Something went wrong!"
            redirect_to car_profile_path(@car)
        end
    end

    def destroy
        @comment = Comment.find params[:id]
        # checking if the user is authorized to delete the comment
        authorize! :destroy, @comment
        @car = CarProfile.find params[:car_profile_id]
        @comment.destroy
        redirect_to car_profile_path(@car)
    end

end
