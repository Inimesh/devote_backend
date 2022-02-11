class Api::TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show update destroy ]

  # GET api/transactions
  # in React => axios http://localhost:3000/api/transactions?user_id={user.id} where user.id is the current user
  # to grab all user transactions
  def index
    p "****"
    p params[:user_id]
    p "****"
    if params[:user_id]
      @user = User.find(params[:user_id])
      render json: @user.transactions
    else
      @transactions = Transaction.all
      render json: @transactions
    end
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
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
