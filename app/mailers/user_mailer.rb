class UserMailer < ApplicationMailer
    default from: "support@melisports.com"

    def confirmation_email(user)
        # @user = params[:user]
        @user = user
        # @url = 'http://melisports.com/login'
        @url = confirmation_url(user.confirmation_token)


        mail(to: @user.email, subject: "Complete Email Sign up.. Welcome to Melisports Tennis.")

    end

    def password_reset_email(user)
        @user = user
        @url = password_reset_url(user)
        mail(to: @user.email, subject: "Password Reset")
    end



    def confirmation_url(confirmation_token)
        "#{Rails.application.config.action_mailer.default_url_options[:host]}/confirm_email?confirmation_token=#{confirmation_token}"

    end
    def password_reset_url (user)

        "#{Rails.application.config.action_mailer.default_url_options[:host]}/reset_password?password_token=#{user.reset_password_token}&user_email=#{user.email}"

    end

end
