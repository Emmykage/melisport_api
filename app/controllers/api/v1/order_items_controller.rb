class Api::V1::OrderItemsController < ApplicationController
  # before_action :initialize_cart
  before_action :authorize

  before_action :set_order_item, only: %i[show update destroy]

  # GET /order_items
  def index
    @order_items = OrderItem.all

    render json: @order_items
  end

  # GET /order_items/1
  def show
    render json: @order_item
  end

  # POST /order_items
  def create
    order_detail = @user.order_details.create(order_detail_params)
    @order_item = OrderItem.create(order_item_params.merge(order_detail_id: order_detail.id))

    if @order_item.valid?
      render json: @order_item, status: :created
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_items/1
  def update
    if @order_item.update(order_item_params)
      render json: @order_item
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_items/1
  def destroy
    @order_item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

  def order_detail_params
    params.require(:order_detail).permit(:total, order_items_attributes: %i[product_id quantity])
  end
end
