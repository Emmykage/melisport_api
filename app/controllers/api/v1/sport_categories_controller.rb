class Api::V1::SportCategoriesController < ApplicationController
  # before_action :authorize
  before_action :set_sport_category, only: %i[show update destroy]

  # GET /sport_categories
  def index
    @sport_categories = SportCategory.all

    render json: @sport_categories
  end


  # POST /sport_categories
  def create
    @sport_categories = SportCategory.new(sport_category_params)
    if @sport_categories.save
      render json: @sport_categories, status: :created
    else
      render json: {message: @sport_categories.errors}, status: :unprocessable_entity
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sport_category
    @sport_category = SportCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sport_category_params
    params.require(:sport_category).permit(:name)
  end
end
