class UsersController < ApplicationController

    before_action :authenticate_user!, except: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new user_params
        if @user.save
            flash[:success] = "Your Accout has been created successfully!"
            redirect_to session_new_path
        else
            render :new
        end
    end

    def edit
        @user = User.find params[:id]
        authorize! :edit, @user
    end

    def update
        @user = User.find params[:id]
        authorize! :update, @user
        @user.first_name = params[:user][:first_name]
        @user.last_name = params[:user][:last_name]
        @user.email = params[:user][:email]
        if @user.save(validate: false)
            flash[:warning] = "You have updated your account seccessfully!"
            redirect_to account_path(@user)
        else
            flash[:danger] = "Something went wrong, try again!"
            redirect_to edit_user_path(@user)
        end
    end

    def destroy
        @user = User.find params[:id]
        authorize! :destroy, @user
        if @user.destroy
            flash[:danger] = 'Your account was deleted successfully!'
            redirect_to root_path
        else
            flash[:warning] = "Something wetn wrong!"
            redirect_to account_path(@user)
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :first_name,
            :last_name,
            :email,
            :password,
            :password_confirmation
        )
    end

end
