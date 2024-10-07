class Api::V1::ProductsController < ApplicationController
  # before_action :authorize, only: %i[create destroy update]
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
      @products = Rails.cache.fetch("products/all", expires_in: 4.hours) do
      Product.all.to_a
    end

    render json: @products

  end


  def new_arrivals
    @products = Rails.cache.fetch("new arrivals", expires_in: 4.hours) do

      Product.where('created_at >= ?', 30.days.ago).order(created_at: :desc ).to_a
    end
    render json: @products
  end


  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create

    @product = Product.new(product_params)

    @product.cloth_sizes = params[:product][:cloth_sizes].split(',').map(&:strip) if params[:product][:cloth_sizes]
    @product.shoe_sizes = params[:product][:shoe_sizes].split(',').map(&:strip) if params[:product][:shoe_sizes]
    @product.grip_sizes = params[:product][:grip_sizes].split(',').map(&:strip) if params[:product][:grip_sizes]
    @product.colours = params[:product][:colours].split(',').map(&:strip) if params[:product][:colours]
    if @product.save
      render json: @product, status: :created
    else
      render json: {message: @product.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    @product.cloth_sizes = params[:product][:cloth_sizes].split(',').map(&:strip) if params[:product][:cloth_sizes]
    @product.shoe_sizes = params[:product][:shoe_sizes].split(',').map(&:strip) if params[:product][:shoe_sizes]
    @product.colours = params[:product][:colours].split(',').map(&:strip) if params[:product][:colours]

    if @product.update(product_params)
      render json: @product
    else
      # logger.debug @product.errors.full_messages

      render json: {message: @product.errors.full_messages.to_sentence}, status: :unprocessable_entity
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

  # def product_params
  #   if params[:product][:photo] == "undefined"
  #   params.require(:product).permit(:name, :grip_size, :head_size, :rating, :weight, :length, :swing_weight, :size, :tension, :colour, :strung, :stiffness, :composition, :description, :price, :sku, :image, :quantity, :product_category_id, :gender_id, :level_id,
  #    :cloth_sizes, :shoe_sizes
  #   # , product_sizes_attributes: [:size, :category,]
  #   )
  #   else
  #     params.require(:product).permit(:name, :grip_size, :head_size, :rating, :weight, :length, :swing_weight, :size, :tension, :colour, :strung, :stiffness, :composition, :description, :price, :sku, :image, :quantity, :product_category_id, :gender_id, :level_id, photos:[],
  #     :cloth_sizes, :shoe_sizes
  #    )
  #   end
  # end

  def product_params
    permitted_params = params.require(:product).permit(
      :name, :grip_size, :head_size, :rating, :weight, :length, :swing_weight,
      :size, :tension, :colour, :strung, :stiffness, :composition, :description, :description_body,
      :price, :sku, :image, :quantity, :product_category_id, :gender_id, :level_id,
      :cloth_sizes, :shoe_sizes, :grip_sizes, :colours, :ms_code, :sport_category_id, :player_type, :head_shape, :recommended_grip, :status, :thickness
    )

    if params[:product][:photos].nil?
      permitted_params

    elsif params[:product][:photos] && params[:product][:photos].values.first == "undefined"
      permitted_params.merge(photos: [])

    else
      permitted_params.merge(photos: params[:product][:photos].values || [])
    end
  end

end
