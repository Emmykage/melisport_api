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
      render @delivery, notice: "Delivery was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deliveries/1
  def update
    if @delivery.update(delivery_params)
      render @delivery, notice: "Delivery was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /deliveries/1
  def destroy
    @delivery.destroy
    redirect_to deliveries_url, notice: "Delivery was successfully destroyed."
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
