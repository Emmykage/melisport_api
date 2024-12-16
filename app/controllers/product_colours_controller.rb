class ProductColoursController < ApplicationController
  before_action :set_product_colour, only: %i[ show edit update destroy ]

  # GET /product_colours
  def index
    @product_colours = ProductColour.all
  end

  # GET /product_colours/1
  def show
  end

  # GET /product_colours/new
  def new
    @product_colour = ProductColour.new
  end

  # GET /product_colours/1/edit
  def edit
  end

  # POST /product_colours
  def create
    @product_colour = ProductColour.new(product_colour_params)

    if @product_colour.save
      redirect_to @product_colour, notice: "Product colour was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_colours/1
  def update
    if @product_colour.update(product_colour_params)
      redirect_to @product_colour, notice: "Product colour was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /product_colours/1
  def destroy
    @product_colour.destroy
    redirect_to product_colours_url, notice: "Product colour was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_colour
      @product_colour = ProductColour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_colour_params
      params.require(:product_colour).permit(:colour, :quantity, :product_id)
    end
end
