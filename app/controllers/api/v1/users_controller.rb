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
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, staus: :unprocessable_entity
    end
    # @user = User.new(user_params)

    # if @user.save
    #   render json: @user, status: :created, location: @user
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end
    # @user = User.create(user_params)

    # if @user.valid?
    #   session[:user_id] = @user.id
    #   render json: user, status: :created

    # else
    #   render json: @user.errors.full_messages, status: :unprocessable_entity

    # end
  end

  def login
    @user = User.find_by(username: user_params[:username] )

    if @user && @user.authenticate(user_params[:password])
      token = encode_token({user_id: @user.id})
      render json: { user: @user, token: token }, status: :ok
      else
        render json: { error: 'Invalid username or password' }, staus: :unprocessable_entity

    end
  end

  # PATCH/PUT /user/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :phone_no, :password)
  end
end
