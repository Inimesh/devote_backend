# frozen_string_literal: true

module Api
  class ConfigsController < ApplicationController
    before_action :set_config, only: %i[show update destroy]

    # GET /configs
    def index
      @configs = Config.all

      render json: @configs
    end

    # GET /configs/1
    def show
      render json: @config
    end

    # POST /configs
    def create
      @config = Config.new(config_params)

      if @config.save
        render json: @config, status: :created, location: @api_config_url
      else
        render json: @config.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /configs/1
    def update
      if @config.update(config_params)
        render json: @config
      else
        render json: @config.errors, status: :unprocessable_entity
      end
    end

    # DELETE /configs/1
    def destroy
      @config.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_config
      @config = Config.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def config_params
      params.require(:config).permit(:round_up_to, :percentage, :round_up_cap, :user_id)
    end
  end
end
