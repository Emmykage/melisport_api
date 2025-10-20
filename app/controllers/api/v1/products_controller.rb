class Api::V1::ProductsController < ApplicationController
  before_action :authorize, only: %i[create destroy update]
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
    products = Product.all


      filter_sport = params[:sport]
      filter_category = params[:category]
      product_name = params[:name]
      filter_gender = params[:gender]

      products = products.joins(:product_category).where(product_categories: { name: filter_category }) if filter_category.present?
      products = products.joins(:sport_category).where(sport_categories: { name: filter_sport }) if filter_sport.present?
      products = products.join(:gender).where(gender: {name: filter_gender}) if filter_gender.present?

      products = products.where("products.name ILIKE ?", "%#{product_name}%") if product_name.present?
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(products)
      },
        status: :ok

    end

    def search
      products = Product.all

      if params[:search].present?
        search_name = params[:search].strip.downcase

        # Combine name search and sport category search using OR
        products = products
                    .left_joins(:sport_category) # left join to include products without sport_category
                    .where("LOWER(products.name) LIKE :search OR LOWER(sport_categories.name) = :search_exact",
                            search: "%#{search_name}%", search_exact: search_name)
      end

      render json: {
        data: ActiveModelSerializers::SerializableResource.new(products)
      }, status: :ok
    end


    def related_products

      filter_by_id = params[:product_id]

      @product = Product.find_by(id: filter_by_id)
      # Ensure we don't try to select more products than exist
      target_size = [Product.count, 10].min

      selected_ids = Set.new
        # ids = Product
        #   .where(product_category_id: @product.product_category_id)
        #   .where.not(id: @product.id)
        #   .pluck(:id)

        # random_ids = ids.sample(10)  # pick 10 random IDs

      while selected_ids.size < target_size
        product = Product.offset(rand(Product.count)).first
        selected_ids.add(product.id) unless selected_ids.include?(product.id)
        break if product.nil?
      end

      @products = if @product.present?
        Product.where(product_category_id: @product.product_category_id).where.not(id: @product.id).order("RANDOM()").limit(10)
      else
         Product.where(id: selected_ids.to_a)
      end
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@products)
      },
        status: :ok

    end





  def new_arrivals
    @products = Rails.cache.fetch("new arrivals", expires_in: 4.hours) do
      Product.where('created_at >= ?', 30.days.ago).order(created_at: :desc ).to_a
    end
    render json: {data: ActiveModelSerializers::SerializableResource.new(@products)}
  end


  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create

    @product = Product.new(product_params)

    if @product.save
      render json: {data: ProductSerializer.new(@product), message: "Product Successfully Created"}, status: :created
    else
      render json: {message: @product.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: {data:ProductSerializer.new(@product), message: "Product updated Created"}, status: :ok
    else
      # logger.debug @product.errors.full_messages

      render json: {message: @product.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  # def update

  # DELETE /products/1
  # def destroy
  #   @product.destroy
  #   render json: { message: "Product deleted successfully" }, status: :ok

  # end

  def destroy
    if @product.destroy
      render json: { message: "Product deleted successfully" }, status: :ok
    else
      render json: { error: "Failed to delete product" }, status: :unprocessable_entity
    end
  end

  # /search
  # def search
  #   @products = Product.where('name LIKE :search', search: "%#{params[:search]}%")
  #   render json: @products
  # end

  private

  # Use callbacks to share coccmmon setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])


  end


  def product_params
   permitted_params = params.require(:product).permit(
  :name, :grip_size, :head_size, :rating, :weight, :length, :swing_weight,
  :size, :tension, :colour, :strung, :stiffness, :composition, :description, :description_body,
  :price, :ms_item_code, :image, :product_quantity, :product_category_id, :gender_id, :level_id,
  :ms_code, :sport_category_id, :player_type, :head_shape, :recommended_grip, :status, :thickness, :discount, :discount_amount, :discount_percentage,
  cloth_sizes: [], grip_sizes: [], colours: [], product_colours_attributes: %i[color quantity], product_inventories_attributes: %i[id size  colour sku price quantity _destroy ] + [{locations: []}]
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
