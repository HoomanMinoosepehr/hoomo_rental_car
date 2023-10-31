class Api::V1::UsersController < ApplicationController

    before_action :authenticate_user!, except: [:new, :create]

    def confirm
        # generating a random code
        @confirm_code = SecureRandom.hex(3)
        @user = current_user
        # saving the code in the database
        @user.confirmed_email_code = @confirm_code
        if @user.save(validate:false)
            # sending the email regarding the confirmation code
            CreateAccountMailer.email_confirmation(@user, @confirm_code).deliver_now
        else
            flash[:danger] = 'Something wnet wrong, Please try again.'
            redirect_to send_path
        end
    end

    # confirming the email address process
    def email_confirm
        @user = current_user
        if @user.confirmed_email_code == params[:confirm]
            # updating the confirmed email status
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

    # creating new user account
    def create
        @user = User.new user_params
        # set the confirmed email status to false by default
        @user.confirmed_email = false
        if @user.save
            # # sending an email to the user to aske them to confirm their email address
            # CreateAccountMailer.notify_new_user(@user).deliver_now
            render json: { message: "Account created successfully!", status: 200 }
        else 
            render json: { message: @user.errors.full_messages, status: 401 }
        end

    end

    def edit
        @user = User.find params[:id]
        authorize! :edit, @user
    end

    # updating user account
    def update
        @user = User.find params[:id]
        new_email = params[:user][:email]
        old_email = @user.email
        authorize! :update, @user
        @user.first_name = params[:user][:first_name]
        @user.last_name = params[:user][:last_name]
        @user.email = params[:user][:email]
        # cheking if the user has changed their email address
        if new_email != old_email
            # if the user has changed their email address, set the confirmed email status to false and they need to confirm the new email address
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

    # deleting user account
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