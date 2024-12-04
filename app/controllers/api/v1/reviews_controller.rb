class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews
  def index
    @reviews = Review.all
    render json: {data: @reviews}, status: :ok
  end

  # GET /reviews/1
  def show

    render json: {data: @review}, status: :ok
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: {data: @review}, status: :ok
    else
      render json: {message: @review.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: {data:  @review}, status: :ok
    else
      render :json {message: @review.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    render  json: {message: "successfully deleted"}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:content)
    end
end
