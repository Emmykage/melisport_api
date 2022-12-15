class PaymentShowsController < ApplicationController
  before_action :set_payment_show, only: %i[ show update destroy ]

  # GET /payment_shows
  def index
    @payment_shows = PaymentShow.all

    render json: @payment_shows
  end

  # GET /payment_shows/1
  def show
    render json: @payment_show
  end

  # POST /payment_shows
  def create
    @payment_show = PaymentShow.new(payment_show_params)

    if @payment_show.save
      render json: @payment_show, status: :created, location: @payment_show
    else
      render json: @payment_show.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payment_shows/1
  def update
    if @payment_show.update(payment_show_params)
      render json: @payment_show
    else
      render json: @payment_show.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payment_shows/1
  def destroy
    @payment_show.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_show
      @payment_show = PaymentShow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_show_params
      params.require(:payment_show).permit(:amount, :provider, :status)
    end
end
