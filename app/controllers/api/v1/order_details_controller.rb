class Api::V1::OrderDetailsController < ApplicationController
  # before_action :initialize_cart
  before_action :authorize

  before_action :set_order_detail, only: %i[update destroy]

  # GET /products
  def index
    @order_details = @current_user.order_details
    render json: @order_details
  end

  # GET /order_details/1
  def show
    @order_detail = OrderDetail.includes(order_items: :product).find(params[:id])
    render json: {data: OrderDetailSerializer.new(@order_detail).as_json}
  end

  # POST /products
  def create
    order_detail = @current_user.order_details.create(order_detail_params)

    # @order_item = OrderItem.new(order_item_params)
    # @order_item =  OrderItem.create(order_item_params.merge(order_detail_id: order_detail.id))


    if order_detail.valid?
      render json: {data: OrderDetailSerializer.new(order_detail).as_json}, status: :created
    else
      render json: {message: order_detail.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @order_detail.update(order_detail_params)
      render json: @order_detail
    else
      render json: @order_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @order_detail.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_detail
    @order_detail = OrderDetail.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

  # Only allow a list of trusted parameters through.
  def order_detail_params
    params.require(:order_detail).permit(:total, :status, :payment_method, order_items_attributes: %i[product_id quantity amount], billing_address_attributes: %i[name email city street phone_no postal_code ] )
  end
end
