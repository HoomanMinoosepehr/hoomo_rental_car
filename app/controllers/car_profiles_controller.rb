class CarProfilesController < ApplicationController

    before_action :authenticate_user! , except: [:show]
    before_action :email_confirmed!, except: [:show]

    def new
        @car = CarProfile.new
        @years = ['2010','2011','2012','2013','2014','2015']
    end

    def create
        @car = CarProfile.new car_params
        @car.image.attach params[:car_profile][:image]
        @car.user = current_user
        if @car.save
            redirect_to welcome_index_path
        else
            flash[:danger] = "Something went wrong!"
            render :new
        end
    end

    def show
        @car = CarProfile.find params[:id]
        @comment = Comment.new
        @like = Like.new
        @favorite = Favorite.new
    end

    def edit
        @car = CarProfile.find params[:id]
        authorize! :edit, @car
        @years = ['2010','2011','2012','2013','2014','2015']
    end

    def update
        @car = CarProfile.find params[:id]
        authorize! :update, @car
        @car.update car_params
        if params[:car_profile][:image].present?
            @car.image.attach params[:car_profile][:image]
        end
        redirect_to car_profile_path(@car)
    end

    def destroy
        @car = CarProfile.find params[:id]
        authorize! :destroy, @car
        @user = @car.user
        if @car.destroy
            flash[:warning] = "Car profile deleted successfully!"
            redirect_to account_path(@user)
        else
            flash[:danger] = "Something went wrong!"
            redirect_to account_path(@user)
        end
    end


    private

    def car_params
        params.require(:car_profile).permit(
            :model,
            :content,
            :year,
            :mileage,
            :location,
            :price,
            :image
        )
    end

end