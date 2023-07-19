class FavoritesController < ApplicationController

    before_action :authenticate_user!

    def index
        @cars = current_user.favorated_cars 
    end

    def create
        @car = CarProfile.find params[:car_profile_id]
        @favorite = Favorite.new(car_profile: @car, user: current_user)
        if @favorite.save
            flash[:success] = "Car added to your favorite list!"
            redirect_to car_profile_path(@car)
        else
            flash[:danger] = "Something went Wrong!"
            redirect_to car_profile_path(@car)
        end
    end

    def destroy
        @car = CarProfile.find params[:car_profile_id]
        @favorite = Favorite.find params[:id]
        if @favorite.destroy
            flash[:warning] = "Car been removed from your favorite list!"
            redirect_to car_profile_path(@car)
        else
            flash[:danger] = "Something went Wrong!"
            redirect_to car_profile_path(@car)
        end
    end

end
