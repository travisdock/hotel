require "application_system_test_case"

class PricingStrategiesTest < ApplicationSystemTestCase
  setup do
    @pricing_strategy = pricing_strategies(:one)
  end

  test "visiting the index" do
    visit pricing_strategies_url
    assert_selector "h1", text: "Pricing strategies"
  end

  test "should create pricing strategy" do
    visit pricing_strategies_url
    click_on "New pricing strategy"

    fill_in "Distance in time", with: @pricing_strategy.distance_in_time
    fill_in "Distance unit", with: @pricing_strategy.distance_unit
    fill_in "End date", with: @pricing_strategy.end_date
    fill_in "Max occupancy", with: @pricing_strategy.max_occupancy
    fill_in "Min occupancy", with: @pricing_strategy.min_occupancy
    fill_in "Multiplier", with: @pricing_strategy.multiplier
    fill_in "Start date", with: @pricing_strategy.start_date
    click_on "Create Pricing strategy"

    assert_text "Pricing strategy was successfully created"
    click_on "Back"
  end

  test "should update Pricing strategy" do
    visit pricing_strategy_url(@pricing_strategy)
    click_on "Edit this pricing strategy", match: :first

    fill_in "Distance in time", with: @pricing_strategy.distance_in_time
    fill_in "Distance unit", with: @pricing_strategy.distance_unit
    fill_in "End date", with: @pricing_strategy.end_date
    fill_in "Max occupancy", with: @pricing_strategy.max_occupancy
    fill_in "Min occupancy", with: @pricing_strategy.min_occupancy
    fill_in "Multiplier", with: @pricing_strategy.multiplier
    fill_in "Start date", with: @pricing_strategy.start_date
    click_on "Update Pricing strategy"

    assert_text "Pricing strategy was successfully updated"
    click_on "Back"
  end

  test "should destroy Pricing strategy" do
    visit pricing_strategy_url(@pricing_strategy)
    click_on "Destroy this pricing strategy", match: :first

    assert_text "Pricing strategy was successfully destroyed"
  end
end
