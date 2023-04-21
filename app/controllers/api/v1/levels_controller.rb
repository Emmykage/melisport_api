class Api::V1::LevelsController < ApplicationController
  # before_action :authorize
  before_action :set_level, only: %i[show update destroy]

  # GET /level
  def index
    @levels = Level.all

    render json: @levels
  end

  # GET /levels/1
  def show
    render json: @level
  end

  # POST /levels
  def create
    @level = Level.new(level_params)

    if @level.save
      render json: @level, status: :created
    else
      render json: @level.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /levels/1
  def update
    if @level.update(level_params)
      render json: @level
    else
      render json: @level.errors, status: :unprocessable_entity
    end
  end

  # DELETE /levels/1
  def destroy
    @level.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_level
    @level = Level.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def level_params
    params.require(:level).permit(:stage)
  end
end
