class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /user/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.create(user_params)

    if @user.valid?
      UserMailer.with(user: @user).welcome_email.deliver_later
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }, status: :ok
    else
      render json: { error: 'failed to create user' }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])
    puts user_params[:email]

    if @user&.authenticate(user_params[:password])
      token = encode_token({ user_id: @user.id })
      #return 
      render json: { user: {last_name: @user.last_name, first_name: @user.first_name, email: @user.email, role:@user.role }, token:}, status: :ok

    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity

    end
  end

  # PATCH/PUT /user/1
  def update
    # authorize
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    authorize
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :phone_no, :password, :role)
  end
end
