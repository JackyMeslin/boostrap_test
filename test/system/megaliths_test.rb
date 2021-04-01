require "application_system_test_case"

class MegalithsTest < ApplicationSystemTestCase
  setup do
    @megalith = megaliths(:one)
  end

  test "visiting the index" do
    visit megaliths_url
    assert_selector "h1", text: "Megaliths"
  end

  test "creating a Megalith" do
    visit megaliths_url
    click_on "New Megalith"

    fill_in "Address", with: @megalith.address
    fill_in "Category", with: @megalith.category
    fill_in "City", with: @megalith.city
    fill_in "Description", with: @megalith.description
    fill_in "Latitude", with: @megalith.latitude
    fill_in "Longitude", with: @megalith.longitude
    fill_in "Name", with: @megalith.name
    click_on "Create Megalith"

    assert_text "Megalith was successfully created"
    click_on "Back"
  end

  test "updating a Megalith" do
    visit megaliths_url
    click_on "Edit", match: :first

    fill_in "Address", with: @megalith.address
    fill_in "Category", with: @megalith.category
    fill_in "City", with: @megalith.city
    fill_in "Description", with: @megalith.description
    fill_in "Latitude", with: @megalith.latitude
    fill_in "Longitude", with: @megalith.longitude
    fill_in "Name", with: @megalith.name
    click_on "Update Megalith"

    assert_text "Megalith was successfully updated"
    click_on "Back"
  end

  test "destroying a Megalith" do
    visit megaliths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Megalith was successfully destroyed"
  end
end
