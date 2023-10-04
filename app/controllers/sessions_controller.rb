class SessionsController < ApplicationController

    def new

    end

    # user login
    def create
        @user = User.find_by_email params[:email]
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:success] = "You've Signed in successfully."
            redirect_to root_path
        else
            flash[:warning] = "Please try again!"
            render :new
        end
    end

    # user logout
    def destroy
        session[:user_id] = nil
        flash[:warning] = "You've Signed out successfully."
        redirect_to root_path
    end

end
