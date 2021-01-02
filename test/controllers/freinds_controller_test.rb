require "test_helper"

class FreindsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @freind = freinds(:one)
  end

  test "should get index" do
    get freinds_url
    assert_response :success
  end

  test "should get new" do
    get new_freind_url
    assert_response :success
  end

  test "should create freind" do
    assert_difference('Freind.count') do
      post freinds_url, params: { freind: { email: @freind.email, first_name: @freind.first_name, last_name: @freind.last_name, phone: @freind.phone, twitter: @freind.twitter } }
    end

    assert_redirected_to freind_url(Freind.last)
  end

  test "should show freind" do
    get freind_url(@freind)
    assert_response :success
  end

  test "should get edit" do
    get edit_freind_url(@freind)
    assert_response :success
  end

  test "should update freind" do
    patch freind_url(@freind), params: { freind: { email: @freind.email, first_name: @freind.first_name, last_name: @freind.last_name, phone: @freind.phone, twitter: @freind.twitter } }
    assert_redirected_to freind_url(@freind)
  end

  test "should destroy freind" do
    assert_difference('Freind.count', -1) do
      delete freind_url(@freind)
    end

    assert_redirected_to freinds_url
  end
end
