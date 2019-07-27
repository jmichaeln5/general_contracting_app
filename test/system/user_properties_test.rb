require "application_system_test_case"

class UserPropertiesTest < ApplicationSystemTestCase
  setup do
    @user_property = user_properties(:one)
  end

  test "visiting the index" do
    visit user_properties_url
    assert_selector "h1", text: "User Properties"
  end

  test "creating a User property" do
    visit user_properties_url
    click_on "New User Property"

    fill_in "Property", with: @user_property.property_id
    fill_in "User", with: @user_property.user_id
    click_on "Create User property"

    assert_text "User property was successfully created"
    click_on "Back"
  end

  test "updating a User property" do
    visit user_properties_url
    click_on "Edit", match: :first

    fill_in "Property", with: @user_property.property_id
    fill_in "User", with: @user_property.user_id
    click_on "Update User property"

    assert_text "User property was successfully updated"
    click_on "Back"
  end

  test "destroying a User property" do
    visit user_properties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User property was successfully destroyed"
  end
end
