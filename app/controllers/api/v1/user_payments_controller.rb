class Api::V1::UserPaymentsController < ApplicationController
  before_action :set_user_payment, only: %i[show update destroy]

  # GET /user_payments
  def index
    @user_payments = UserPayment.all

    render json: @user_payments
  end

  # GET /user_payments/1
  def show
    render json: @user_payment
  end

  # POST /user_payments
  def create
    @user_payment = UserPayment.new(user_payment_params)

    if @user_payment.save
      render json: @user_payment, status: :created, location: @user_payment
    else
      render json: @user_payment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_payments/1
  def update
    if @user_payment.update(user_payment_params)
      render json: @user_payment
    else
      render json: @user_payment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_payments/1
  def destroy
    @user_payment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_payment
    @user_payment = UserPayment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_payment_params
    params.require(:user_payment).permit(:payment_type, :provider, :account_no, :expiry)
  end
end
