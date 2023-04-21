class Api::V1::GendersController < ApplicationController
  # before_action :authorize
  before_action :set_gender, only: %i[show update destroy]

  # GET /gender
  def index
    @genders = Gender.all

    render json: @genders
  end

  # GET /genders/1
  def show
    render json: @gender
  end

  # POST /genders
  def create
    @gender = Gender.new(gender_params)

    if @gender.save
      render json: @gender, status: :created
    else
      render json: @gender.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genders/1
  def update
    if @gender.update(gender_params)
      render json: @gender
    else
      render json: @gender.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genders/1
  def destroy
    @gender.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gender
    @gender = Gender.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gender_params
    params.require(:gender).permit(:name)
  end
end
