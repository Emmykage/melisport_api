class Api::V1::CourtsController < ApplicationController
  before_action :set_court, only: %i[ show update destroy ]

  # GET /courts
  def index
    @courts = Court.all

    render json: {data: @courts}
  end

  # GET /courts/1
  def show
    render json: {data: @court}
  end

  # POST /courts
  def create
    @court = Court.new(court_params)

    if @court.save
      render json: {data: @court}, status: :created
    else
      render json: {message: @court.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courts/1
  def update
    if @court.update(court_params)
      render json: {data: @court}
    else
      render json: {message: @court.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  # DELETE /courts/1
  def destroy
    @court.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_court
      @court = Court.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def court_params
      params.require(:court).permit(:address, :state, :city)
    end
end
