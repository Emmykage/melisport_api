class UserMailer < ApplicationMailer
    default from: "info@melisports.com"

    def confirmation_email(user) 
        # @user = params[:user]
        @user = user
        # @url = 'http://melisports.com/login'
        @url = confirmation_url(user.confirmation_token)


        mail(to: @user.email, subject: "Complete Email Sign up.. Welcome to Melisports Tennis.")
      
    end


    def confirmation_url(confirmation_token)
        "#{Rails.application.config.action_mailer.default_url_options[:host]}/confirm_email?confirmation_token=#{confirmation_token}"
      
    end
end
