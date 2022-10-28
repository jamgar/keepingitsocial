require "test_helper"

class ElementControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get element_new_url
    assert_response :success
  end

  test "should get edit" do
    get element_edit_url
    assert_response :success
  end

  test "should get create" do
    get element_create_url
    assert_response :success
  end

  test "should get update" do
    get element_update_url
    assert_response :success
  end

  test "should get destroy" do
    get element_destroy_url
    assert_response :success
  end
end
