require 'test_helper'

class UserPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_property = user_properties(:one)
  end

  test "should get index" do
    get user_properties_url
    assert_response :success
  end

  test "should get new" do
    get new_user_property_url
    assert_response :success
  end

  test "should create user_property" do
    assert_difference('UserProperty.count') do
      post user_properties_url, params: { user_property: { property_id: @user_property.property_id, user_id: @user_property.user_id } }
    end

    assert_redirected_to user_property_url(UserProperty.last)
  end

  test "should show user_property" do
    get user_property_url(@user_property)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_property_url(@user_property)
    assert_response :success
  end

  test "should update user_property" do
    patch user_property_url(@user_property), params: { user_property: { property_id: @user_property.property_id, user_id: @user_property.user_id } }
    assert_redirected_to user_property_url(@user_property)
  end

  test "should destroy user_property" do
    assert_difference('UserProperty.count', -1) do
      delete user_property_url(@user_property)
    end

    assert_redirected_to user_properties_url
  end
end
