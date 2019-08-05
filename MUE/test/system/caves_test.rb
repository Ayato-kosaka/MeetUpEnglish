require "application_system_test_case"

class CavesTest < ApplicationSystemTestCase
  setup do
    @cafe = caves(:one)
  end

  test "visiting the index" do
    visit caves_url
    assert_selector "h1", text: "Caves"
  end

  test "creating a Cafe" do
    visit caves_url
    click_on "New Cafe"

    fill_in "Cityid", with: @cafe.cityId
    fill_in "Description", with: @cafe.description
    fill_in "Name", with: @cafe.name
    click_on "Create Cafe"

    assert_text "Cafe was successfully created"
    click_on "Back"
  end

  test "updating a Cafe" do
    visit caves_url
    click_on "Edit", match: :first

    fill_in "Cityid", with: @cafe.cityId
    fill_in "Description", with: @cafe.description
    fill_in "Name", with: @cafe.name
    click_on "Update Cafe"

    assert_text "Cafe was successfully updated"
    click_on "Back"
  end

  test "destroying a Cafe" do
    visit caves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cafe was successfully destroyed"
  end
end
