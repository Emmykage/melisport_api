class Api::V1::OrderDetailsController < ApplicationController
  # before_action :initialize_cart
  before_action :authorize, except: %i[create]

  before_action :set_order_detail, only: %i[update destroy]

  # GET /products
  def index

    @order_details = OrderDetail.includes({order_items: [:product]}, :billing_address).all
    render json: {data:  ActiveModelSerializers::SerializableResource.new(@order_details)}, status: :ok
   end

  # GET /order_details/1
  def show
    @order_detail = OrderDetail.includes(order_items: :product).find(params[:id])
    render json: {data: OrderDetailSerializer.new(@order_detail).as_json}
  end

  # POST /products
  def create

    order_detail = if @current_user.present?
      @current_user.order_details.create(order_detail_params)
    else
      OrderDetail.create(order_detail_params)
    end

   if order_detail.valid?
      render json: {data: OrderDetailSerializer.new(order_detail).as_json}, status: :created
    else
      render json: {message: order_detail.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @order_detail.update(order_detail_params)

      render json: {data: OrderDetailSerializer.new(@order_detail).as_json}, status: :ok

    else
      render json:{messsage: @order_detail.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @order_detail.destroy
    render json: {message: "Order has been Successfully Deleted"}, status: :ok
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
