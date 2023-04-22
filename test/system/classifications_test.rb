require "application_system_test_case"

class ClassificationsTest < ApplicationSystemTestCase
  setup do
    @classification = classifications(:one)
  end

  test "visiting the index" do
    visit classifications_url
    assert_selector "h1", text: "Classifications"
  end

  test "should create classification" do
    visit classifications_url
    click_on "New classification"

    fill_in "Name", with: @classification.name
    click_on "Create Classification"

    assert_text "Classification was successfully created"
    click_on "Back"
  end

  test "should update Classification" do
    visit classification_url(@classification)
    click_on "Edit this classification", match: :first

    fill_in "Name", with: @classification.name
    click_on "Update Classification"

    assert_text "Classification was successfully updated"
    click_on "Back"
  end

  test "should destroy Classification" do
    visit classification_url(@classification)
    click_on "Destroy this classification", match: :first

    assert_text "Classification was successfully destroyed"
  end
end
