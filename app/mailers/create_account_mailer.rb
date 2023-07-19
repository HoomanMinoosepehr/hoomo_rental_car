class CreateAccountMailer < ApplicationMailer

    def email_confirmation(user, code)
        @user = user
        @confirmation_code = code
        mail(to: @user.email, subject: "Confirm your email address")
    end

    def notify_new_user(user)
        @user = user
        mail(to: @user.email , subject: "Welcome to Hoomo Rental Car!")
    end

end
