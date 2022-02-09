require "test_helper"

class ConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @config = configs(:one)
  end

  test "should get index" do
    get configs_url, as: :json
    assert_response :success
  end

  test "should create config" do
    assert_difference("Config.count") do
      post configs_url, params: { config: { percentage: @config.percentage, round_up_cap: @config.round_up_cap, round_up_to: @config.round_up_to } }, as: :json
    end

    assert_response :created
  end

  test "should show config" do
    get config_url(@config), as: :json
    assert_response :success
  end

  test "should update config" do
    patch config_url(@config), params: { config: { percentage: @config.percentage, round_up_cap: @config.round_up_cap, round_up_to: @config.round_up_to } }, as: :json
    assert_response :success
  end

  test "should destroy config" do
    assert_difference("Config.count", -1) do
      delete config_url(@config), as: :json
    end

    assert_response :no_content
  end
end
