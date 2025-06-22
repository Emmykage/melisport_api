class Api::V1::DeliveriesController < ApplicationController
  before_action :set_delivery, only: %i[ show edit update destroy ]

  # GET /deliveries
  def index
    @deliveries = Delivery.all
    render json:{data:  @deliveries}

  end

  # GET /deliveries/1
  def show
    render json:{data: @delivery}, status: :ok
  end



  # POST /deliveries
  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      render json: { data: @delivery, message: "Delivery was successfully created."}, status: :ok
    else
      render json: { message: @delivery.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deliveries/1
  def update
    if @delivery.update(delivery_params)
      render json: { data: @delivery, message: "Delivery Update was successfully created."}, status: :ok
    else
      render json: { message: @delivery.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  # DELETE /deliveries/1
  def destroy
    if  @delivery.destroy
    render json: {message: "Delivery was successfully destroyed."}, status: :ok
      else
      render json: { message: "Failed to delete product" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def delivery_params
      params.require(:delivery).permit(:state, :city, :delivery_fee)
    end
end
