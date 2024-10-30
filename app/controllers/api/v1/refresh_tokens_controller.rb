class Api::V1::RefreshTokensController < ApplicationController
    # before_action :set_user, only: %i[show update destroy]
    # before_action :authorize, only: %i[showUser userProfile]


    def generate_refresh_token

        if params[:refresh_token].blank?
            render json: {
                message: "Refresh token is missing"
            }, status: :bad_request

        end
        user = User.find_by(refresh_token: params[:refresh_token])

        if user
           token =  encode_token({user_id: user.id})

           render json: {
            access_token: token,
            refresh_token: user.refresh_token
           }, status: :ok

        else
            render json: {
                message: "Invalid reference key"
            }, status: :unauthorized
        end

    end


end