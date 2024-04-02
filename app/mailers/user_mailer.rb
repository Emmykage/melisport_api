class UserMailer < ApplicationMailer
    default from: "info@melisports.com"

    def welcome_email 
        @user = params[:user]
        @url = 'http://melisports.com/login'
        mail(to: @user.email, subject: "Complete Email Sign up.. Welcome to Melisports Tennis.")
      
    end
end
