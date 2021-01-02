require "application_system_test_case"

class FreindsTest < ApplicationSystemTestCase
  setup do
    @freind = freinds(:one)
  end

  test "visiting the index" do
    visit freinds_url
    assert_selector "h1", text: "Freinds"
  end

  test "creating a Freind" do
    visit freinds_url
    click_on "New Freind"

    fill_in "Email", with: @freind.email
    fill_in "First name", with: @freind.first_name
    fill_in "Last name", with: @freind.last_name
    fill_in "Phone", with: @freind.phone
    fill_in "Twitter", with: @freind.twitter
    click_on "Create Freind"

    assert_text "Freind was successfully created"
    click_on "Back"
  end

  test "updating a Freind" do
    visit freinds_url
    click_on "Edit", match: :first

    fill_in "Email", with: @freind.email
    fill_in "First name", with: @freind.first_name
    fill_in "Last name", with: @freind.last_name
    fill_in "Phone", with: @freind.phone
    fill_in "Twitter", with: @freind.twitter
    click_on "Update Freind"

    assert_text "Freind was successfully updated"
    click_on "Back"
  end

  test "destroying a Freind" do
    visit freinds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Freind was successfully destroyed"
  end
end
