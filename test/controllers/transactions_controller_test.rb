# frozen_string_literal: true

require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test 'should get index' do
    get api_transactions_url, as: :json
    assert_response :success
  end

  test 'should create transaction' do
    assert_difference('Transaction.count') do
      post api_transactions_url,
           params: { transaction: { amount: @transaction.amount, round_up: @transaction.round_up, user_id: @transaction.user_id } }, as: :json
    end

    assert_response :created
  end

  test 'should show transaction' do
    get api_transaction_url(@transaction), as: :json
    assert_response :success
  end

  test 'should update transaction' do
    patch api_transaction_url(@transaction),
          params: { transaction: { amount: @transaction.amount, round_up: @transaction.round_up, user_id: @transaction.user_id } }, as: :json
    assert_response :success
  end

  test 'should destroy transaction' do
    assert_difference('Transaction.count', -1) do
      delete api_transaction_url(@transaction), as: :json
    end

    assert_response :no_content
  end
end
