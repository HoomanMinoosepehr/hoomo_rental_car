class Api::V1::SessionsController < ApplicationController

    # user login
    def create

        @user = User.find_by_email params[:email]
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id

            render json: { message: "You've Logged in successfully!", id: @user.id, full_name: @user.full_name, status: 200 }
        else
            render json: { message: "Email or Password is wrong!", status: 404 }
        end

    end

    # user logout
    def destroy

        session[:user_id] = nil
        if session[:user_id] == nil
            render json: { message: "You've successfully logged out.", status: 200 }
        else
            render json: { message: "Something went wrong, Please try again later.", status: 500 }
        end

    end

end
