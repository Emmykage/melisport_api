class RegistrationsController < ApplicationController

    def confirm_email
        @user = User.find_by(confirmation_token: params[:confirmation_token])


        if @user 
            @user.confirmed_at = Time.current
            @user.confirmation_token = nil

            if @user.save(validate: false)
                render jsoon: {message: 'Email confirmed successfully'}
            else
                render json: {error: @user.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: 'Invalid confirmation token'}, status: :unprocessable_entity

        end
    end
end
