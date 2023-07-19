class UsersController < ApplicationController

    before_action :authenticate_user!, except: [:new, :create]

    def new
        @user = User.new
    end

    def confirming

    end

    def confirm
        @confirm_code = SecureRandom.hex(3)
        @user = current_user
        @user.confirmed_email_code = @confirm_code
        if @user.save(validate:false)
            CreateAccountMailer.email_confirmation(@user, @confirm_code).deliver_now
        else
            flash[:danger] = 'Something wnet wrong, Please try again.'
            redirect_to send_path
        end
    end

    def reconfirm

    end

    def email_confirm
        @user = current_user
        if @user.confirmed_email_code == params[:confirm]
            @user.confirmed_email = true
            if @user.save(validate: false)
                flash[:success] = "Your email address has been confirmed successfully!"
                redirect_to root_path
            else
                flash[:danger] = "Something went wrong, try again!"
                redirect_to usrs_reconfirm_path
            end
        else
            flash[:warning] = "The code you have entered is wrong! Please try again."
            redirect_to users_reconfirm_path
        end
    end

    def create
        @user = User.new user_params
        @user.confirmed_email = false
        if @user.save
            CreateAccountMailer.notify_new_user(@user).deliver_now
            flash[:success] = "Your Accout has been created successfully!"
            redirect_to session_new_path
        end
    end

    def edit
        @user = User.find params[:id]
        authorize! :edit, @user
    end

    def update
        @user = User.find params[:id]
        new_email = params[:user][:email]
        old_email = @user.email
        authorize! :update, @user
        @user.first_name = params[:user][:first_name]
        @user.last_name = params[:user][:last_name]
        @user.email = params[:user][:email]
        if new_email != old_email
            @user.confirmed_email = false
        end
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
            :password_confirmation,
            :admin,
            :confirmed_email
        )
    end

end
