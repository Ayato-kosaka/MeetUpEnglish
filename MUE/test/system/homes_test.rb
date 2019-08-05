require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  setup do
    @home = homes(:one)
  end

  test "visiting the index" do
    visit homes_url
    assert_selector "h1", text: "Homes"
  end

  test "creating a Home" do
    visit homes_url
    click_on "New Home"

    fill_in "Cafeid", with: @home.cafeId
    fill_in "Cityid", with: @home.cityId
    fill_in "Date", with: @home.date
    fill_in "End", with: @home.end
    fill_in "Peoplenum", with: @home.peopleNum
    fill_in "Start", with: @home.start
    fill_in "Teacherid", with: @home.teacherId
    click_on "Create Home"

    assert_text "Home was successfully created"
    click_on "Back"
  end

  test "updating a Home" do
    visit homes_url
    click_on "Edit", match: :first

    fill_in "Cafeid", with: @home.cafeId
    fill_in "Cityid", with: @home.cityId
    fill_in "Date", with: @home.date
    fill_in "End", with: @home.end
    fill_in "Peoplenum", with: @home.peopleNum
    fill_in "Start", with: @home.start
    fill_in "Teacherid", with: @home.teacherId
    click_on "Update Home"

    assert_text "Home was successfully updated"
    click_on "Back"
  end

  test "destroying a Home" do
    visit homes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Home was successfully destroyed"
  end
end
