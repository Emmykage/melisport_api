class Api::V1::ProductsController < ApplicationController
  # before_action :authorize
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  # /search
  def search
    @products = Product.where('name LIKE :search', search: "%#{params[:search]}%")
    render json: @products
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :grip_size, :head_size, :rating, :weight, :length, :swing_weight, :size, :tension, :colour, :strung,
                                    :stiffness, :composition, :description, :price, :sku, :image, :product_category_id, :gender_id, :level_id, cloth_sizes_attributes: [:abbrv], shoe_sizes_attributes: [:abbrv])
  end
end
