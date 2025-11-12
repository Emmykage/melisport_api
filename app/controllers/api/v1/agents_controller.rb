class Api::V1::AgentsController < ApplicationController
  before_action :set_agent, only: %i[show update destroy]

  # GET /agents
  def index
    @agents = Agent.all

    render json: @agents
  end

  # GET /agents/1
  def show
    render json: { data: @agent }
  end

  # POST /agents
  def create
    @agent = Agent.new(agent_params)

    if @agent.save

      # binding.pry

      render json: { data: @agent }, status: :created
    else
      render json: { message: @agent.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agents/1
  def update
    if @agent.update(agent_params)
      render json: @agent
    else
      render json: @agent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agents/1
  def destroy
    @agent.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_agent
    @agent = Agent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def agent_params
    params.require(:agent).permit(:name, :email, :phone, :discount, :referral_code, :commission, :role, :discount,
                                  :active)
  end
end
