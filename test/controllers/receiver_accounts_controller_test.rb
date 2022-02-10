require "test_helper"

class ReceiverAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receiver_account = receiver_accounts(:one)
  end

  test "should get index" do
    get receiver_accounts_url, as: :json
    assert_response :success
  end

  test "should create receiver_account" do
    assert_difference("ReceiverAccount.count") do
      post receiver_accounts_url, params: { receiver_account: { account_name: @receiver_account.account_name, account_no: @receiver_account.account_no, sort_code: @receiver_account.sort_code, user_id: @receiver_account.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show receiver_account" do
    get receiver_account_url(@receiver_account), as: :json
    assert_response :success
  end

  test "should update receiver_account" do
    patch receiver_account_url(@receiver_account), params: { receiver_account: { account_name: @receiver_account.account_name, account_no: @receiver_account.account_no, sort_code: @receiver_account.sort_code, user_id: @receiver_account.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy receiver_account" do
    assert_difference("ReceiverAccount.count", -1) do
      delete receiver_account_url(@receiver_account), as: :json
    end

    assert_response :no_content
  end
end
