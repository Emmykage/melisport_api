class ShoeSizesController < ApplicationController
  before_action :set_shoe_size, only: %i[show edit update destroy]

  # GET /shoe_sizes
  def index
    @shoe_sizes = ShoeSize.all
  end

  # GET /shoe_sizes/1
  def show; end

  # GET /shoe_sizes/new
  def new
    @shoe_size = ShoeSize.new
  end

  # GET /shoe_sizes/1/edit
  def edit; end

  # POST /shoe_sizes
  def create
    @shoe_size = ShoeSize.new(shoe_size_params)

    if @shoe_size.save
      redirect_to @shoe_size, notice: 'Shoe size was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shoe_sizes/1
  def update
    if @shoe_size.update(shoe_size_params)
      redirect_to @shoe_size, notice: 'Shoe size was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /shoe_sizes/1
  def destroy
    @shoe_size.destroy
    redirect_to shoe_sizes_url, notice: 'Shoe size was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shoe_size
    @shoe_size = ShoeSize.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def shoe_size_params
    params.require(:shoe_size).permit(:size, :quantity)
  end
end
