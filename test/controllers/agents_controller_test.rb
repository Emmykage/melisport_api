require "test_helper"

class AgentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent = agents(:one)
  end

  test "should get index" do
    get agents_url, as: :json
    assert_response :success
  end

  test "should create agent" do
    assert_difference("Agent.count") do
      post agents_url, params: { agent: { commission: @agent.commission, discout: @agent.discout, email: @agent.email, name: @agent.name, phone: @agent.phone, referral_code: @agent.referral_code, role: @agent.role, status: @agent.status } }, as: :json
    end

    assert_response :created
  end

  test "should show agent" do
    get agent_url(@agent), as: :json
    assert_response :success
  end

  test "should update agent" do
    patch agent_url(@agent), params: { agent: { commission: @agent.commission, discout: @agent.discout, email: @agent.email, name: @agent.name, phone: @agent.phone, referral_code: @agent.referral_code, role: @agent.role, status: @agent.status } }, as: :json
    assert_response :success
  end

  test "should destroy agent" do
    assert_difference("Agent.count", -1) do
      delete agent_url(@agent), as: :json
    end

    assert_response :no_content
  end
end
