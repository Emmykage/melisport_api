class Api::V1::ProductImagesController < ApplicationController
    before_action :set_product_image, only: %i[ show update destroy ]

  # GET /product_imagess
  def index
    @product_images = ProductImage.all

    render json: @product_images
  end

  # GET /product_imagess/1
  def show
    render json: @product_image
  end

  # POST /product_imagess
  def create
    @product_image = ProductImage.new(product_images_params)

    if @product_image.save
      render json: @product_image, status: :created, location: @product_image
    else
      render json: @product_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_imagess/1
  def update
    if @product_images.update(product_images_params)
      render json: @product_images
    else
      render json: @product_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_imagess/1
  def destroy
    @product_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_image
      @product_image = ProductImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_images_params
      params.require(:product_image).permit(:images, :product_id)
    end
end
