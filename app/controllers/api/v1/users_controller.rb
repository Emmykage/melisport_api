class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :authorize, only: %i[showUser user_profile_update user_password_update userProfile destroy]
  before_action :ensure_super_user, only: %i[destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /user/1
  def show
    render json: { data: ActiveModelSerializers::SerializableResource.new(@user) }, status: :ok
  end

  def showUser
    render json: @current_user
  end

  def userProfile
    render json: { data: ActiveModelSerializers::SerializableResource.new(@current_user) }, status: :ok
  end

  # POST /users
def create
  @user = User.new(user_params)

  if @user.save
    # UserMailer.with(user: @user).welcome_email.deliver_later

    render json: {
      user: @user #.slice(:id, :email, :role), # safe fields only
      message: 'Confirmation email sent'
    }, status: :created
  else
    render json: {
      error: @user.errors.full_messages.to_sentence
    }, status: :unprocessable_entity
  end
end

  def login
    @user = User.find_by(email: user_params[:email])

    if @user&.authenticate(user_params[:password])
      @user.generate_refresh_token

      # temporary confirm by user login
      # @user.confirm_user

      SendLoginNotificationJob.perform_later(@user)



      token = encode_token({ user_id: @user.id })
      render json: { data: @user.slice(:id, :role, :first_name, :last_name, :email, :phone_no).merge(confirmed: @user.confirmed), token: { access_token: token, refresh_token: @user.refresh_token }, message: 'Login Successful' },
             status: :ok

    else
      render json: { message: 'Invalid username or password' }, status: :unprocessable_entity
    end
  end

  def password_reset
    @user = User.find_by(email: params[:user][:email])
    @user.generate_password_token
    UserMailer.password_reset_email(@user).deliver_later
  end

  # PATCH/PUT /user/1
  def update
    if @user.update(user_params.merge(skip_email_validation: true, skip_password_validation: true))
      render json: @user
    else
      render json: { message: @user.errors }, status: :unprocessable_entity
    end
  end

  def user_profile_update
    if @current_user.update(user_params)
      render json: { data: @current_user, message: 'user updated' }
    else
      render json: { message: @current_user.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def user_password_update
    if @current_user&.authenticate(user_params[:old_password])
      if user_params[:password] == user_params[:confirm_password]
        if @current_user.update(user_params)
          render json: { data: @current_user, message: 'user updated' }
        else
          render json: { message: @current_user.errors.full_messages.to_sentence }, status: :unprocessable_entity
        end
      else
        render json: { message: 'password do not match correct' }, status: :unprocessable_entity
      end

    else
      render json: { message: 'current password is invalid' }, status: :unprocessable_entity
    end
  end

  def user_profile_delete
    @current_user.destroy
    render json: { message: 'you account has been deleted Successfully' }, status: :ok
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: { message: 'deleted Successfully' }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    permitted_params = params.require(:user).permit(:username, :first_name, :last_name, :email, :phone_no, :password,
                                                    :confirm_password, :old_password, :role, profile_attributes: %i[state address])
    permitted_params[:email] = permitted_params[:email].downcase if permitted_params[:email].present?
    permitted_params
  end
end
