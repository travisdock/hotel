class PricingStrategiesController < ApplicationController
  before_action :set_pricing_strategy, only: %i[ show edit update destroy ]

  # GET /pricing_strategies
  def index
    @pricing_strategies = PricingStrategy.all
  end

  # GET /pricing_strategies/1
  def show
  end

  # GET /pricing_strategies/new
  def new
    @pricing_strategy = PricingStrategy.new
  end

  # GET /pricing_strategies/1/edit
  def edit
  end

  # POST /pricing_strategies
  def create
    @pricing_strategy = PricingStrategy.new(pricing_strategy_params)

    if @pricing_strategy.save
      redirect_to @pricing_strategy, notice: "Pricing strategy was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pricing_strategies/1
  def update
    if @pricing_strategy.update(pricing_strategy_params)
      redirect_to @pricing_strategy, notice: "Pricing strategy was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pricing_strategies/1
  def destroy
    @pricing_strategy.destroy
    redirect_to pricing_strategies_url, notice: "Pricing strategy was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pricing_strategy
      @pricing_strategy = PricingStrategy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pricing_strategy_params
      params.require(:pricing_strategy).permit(:multiplier, :min_occupancy, :max_occupancy, :start_date, :end_date, :distance_in_time, :distance_unit)
    end
end
