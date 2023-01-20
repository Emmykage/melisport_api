class Api::V1::CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[show update destroy]

  # GET /products
  def index
    @cart_items = CartItem.all

    render json: @cart_items
  end

  # GET /cart_items/1
  def show
    render json: @cart_item
  end

  # POST /products
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.shopping_cart_id = initialize_cart.id
    if @cart_item.save
      render json: @cart_item, status: :created
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @cart_item.update(cart_item_params)
      render json: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @cart_item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @cart_item = CartItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id, :shopping_cart_id)
  end
end
