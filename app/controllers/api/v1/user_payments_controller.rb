class Api::V1::UserPaymentsController < ApplicationController
    before_action :set_probuct, only: %i[ show update destroy ]
      
        # GET /probucts
        def index
          @probucts = Probuct.all
      
          render json: @probucts
        end
      
        # GET /probucts/1
        def show
          render json: @probuct
        end
      
        # POST /probucts
        def create
          @probuct = Probuct.new(probuct_params)
      
          if @probuct.save
            render json: @probuct, status: :created, location: @probuct
          else
            render json: @probuct.errors, status: :unprocessable_entity
          end
        end
      
        # PATCH/PUT /probucts/1
        def update
          if @probuct.update(probuct_params)
            render json: @probuct
          else
            render json: @probuct.errors, status: :unprocessable_entity
          end
        end
      
        # DELETE /probucts/1
        def destroy
          @probuct.destroy
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_probuct
            @probuct = Probuct.find(params[:id])
          end
      
          # Only allow a list of trusted parameters through.
          def probuct_params
            params.require(:probuct).permit(:name, :description, :price, :product_category_id)
          end

       
end
