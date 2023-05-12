require "test_helper"

class PricingStrategiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pricing_strategy = pricing_strategies(:one)
  end

  test "should get index" do
    get pricing_strategies_url
    assert_response :success
  end

  test "should get new" do
    get new_pricing_strategy_url
    assert_response :success
  end

  test "should create pricing_strategy" do
    assert_difference("PricingStrategy.count") do
      post pricing_strategies_url, params: { pricing_strategy: { distance_in_time: @pricing_strategy.distance_in_time, distance_unit: @pricing_strategy.distance_unit, end_date: @pricing_strategy.end_date, max_occupancy: @pricing_strategy.max_occupancy, min_occupancy: @pricing_strategy.min_occupancy, multiplier: @pricing_strategy.multiplier, start_date: @pricing_strategy.start_date } }
    end

    assert_redirected_to pricing_strategy_url(PricingStrategy.last)
  end

  test "should show pricing_strategy" do
    get pricing_strategy_url(@pricing_strategy)
    assert_response :success
  end

  test "should get edit" do
    get edit_pricing_strategy_url(@pricing_strategy)
    assert_response :success
  end

  test "should update pricing_strategy" do
    patch pricing_strategy_url(@pricing_strategy), params: { pricing_strategy: { distance_in_time: @pricing_strategy.distance_in_time, distance_unit: @pricing_strategy.distance_unit, end_date: @pricing_strategy.end_date, max_occupancy: @pricing_strategy.max_occupancy, min_occupancy: @pricing_strategy.min_occupancy, multiplier: @pricing_strategy.multiplier, start_date: @pricing_strategy.start_date } }
    assert_redirected_to pricing_strategy_url(@pricing_strategy)
  end

  test "should destroy pricing_strategy" do
    assert_difference("PricingStrategy.count", -1) do
      delete pricing_strategy_url(@pricing_strategy)
    end

    assert_redirected_to pricing_strategies_url
  end
end
