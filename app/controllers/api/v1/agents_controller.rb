class Api::V1::AgentsController < ApplicationController
  before_action :authorize, except: [:get_agent_by_code]
  before_action :set_agent, only: %i[show update destroy]
  before_action :set_agent_from_code, only: %i[get_agent_by_code]

  # GET /agents
  def index
    code = params[:code]
    agents = Agent.all

    agents.where(code: code) if code.present?



    render json: {data:  agents}
  end

  # GET /agents/1
  def show
    code = params[:id]
    render json: { data: @agent }
  end

  def get_agent_by_code
    render json: { data: @agent }, status: :ok
  end

  # POST /agents
  def create
    @agent = Agent.new(agent_params)

    if @agent.save
      render json: { data: @agent, message: "Agent #{@agent.name} has been created" }, status: :created
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

  def set_agent_from_code
    @agent = Agent.find_by(referral_code: params[:id])
    return render json: {message: "No agent with code exists"}, status: :unprocessable_entity unless @agent

 end


  # Only allow a list of trusted parameters through.
  def agent_params
    params.require(:agent).permit(:name, :email, :phone, :discount, :referral_code, :commission, :role, :discount,
                                  :active)
  end
end
