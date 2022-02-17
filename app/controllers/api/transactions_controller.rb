class Api::TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show update destroy ]
  # GET api/transactions
  # in React => axios http://localhost:3000/api/transactions?user_id={user.id} where user.id is the current user
  # to grab all user transactions
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      render json: @user.transactions.order('created_at DESC')
    else
      @transactions = Transaction.all
      render json: @transactions
    end
  end

  def new
    @transaction = Transaction.new
    render "new"
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)
    # add auto transaction round up
    @user = User.find(@transaction.user_id)
    @round_up = BigDecimal(@transaction.amount.ceil.to_s) - @transaction.amount
    @round_up = nil if @round_up <= 0

    if @user.config.percentage
      @round_up = (@transaction.amount * @user.config.round_up_to)/100.0
      @round_up = @round_up.round(2)
    end

    @transaction.round_up = @round_up

    if @transaction.save
      render json: @transaction, status: :created, location: api_transactions_url
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:amount, :round_up, :name, :user_id)
    end
end
