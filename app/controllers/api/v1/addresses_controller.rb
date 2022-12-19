class Api::V1::AddressesController < ApplicationController
    before_action :set_address, only: %i[ show update destroy ]

    # GET /products
    def index
      @addresses = Address.all
  
      render json: @products
    end
  
    # GET /addresses/1
    def show
      render json: @address
    end
  
    # POST /addresses
    def create
      @address = Address.new(addresses_params)
  
      if @address.save
        render json: @address, status: :created, location: @address
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /products/1
    def update
      if @product.update(address_params)
        render json: @address
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /products/1
    def destroy
      @address.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @address = Address.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:address).permit(:name, :description, :price, :image, :product_category_id)
      end
end
