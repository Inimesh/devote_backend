class Api::ReceiverAccountsController < ApplicationController
  before_action :set_receiver_account, only: %i[ show update destroy ]

  # GET /receiver_accounts
  def index
    @receiver_accounts = ReceiverAccount.all

    render json: @receiver_accounts
  end

  # GET /receiver_accounts/1
  def show
    render json: @receiver_account.slice(:account_name)
  end

  # POST /receiver_accounts
  def create
    @receiver_account = ReceiverAccount.new(receiver_account_params)

    if @receiver_account.save
      render json: @receiver_account, status: :created, location: api_receiver_accounts_url
    else
      render json: @receiver_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /receiver_accounts/1
  def update
    if @receiver_account.update(receiver_account_params)
      render json: @receiver_account
    else
      render json: @receiver_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /receiver_accounts/1
  def destroy
    @receiver_account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receiver_account
      @receiver_account = ReceiverAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receiver_account_params
      params.require(:receiver_account).permit(:account_name, :account_no, :sort_code, :user_id)
    end
end
