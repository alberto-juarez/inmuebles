require 'test_helper'

class DuenosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dueno = duenos(:one)
  end

  test "should get index" do
    get duenos_url
    assert_response :success
  end

  test "should get new" do
    get new_dueno_url
    assert_response :success
  end

  test "should create dueno" do
    assert_difference('Dueno.count') do
      post duenos_url, params: { dueno: { cel: @dueno.cel, comments: @dueno.comments, email: @dueno.email, first_name: @dueno.first_name, last_name: @dueno.last_name, property_id: @dueno.property_id, tel: @dueno.tel } }
    end

    assert_redirected_to dueno_url(Dueno.last)
  end

  test "should show dueno" do
    get dueno_url(@dueno)
    assert_response :success
  end

  test "should get edit" do
    get edit_dueno_url(@dueno)
    assert_response :success
  end

  test "should update dueno" do
    patch dueno_url(@dueno), params: { dueno: { cel: @dueno.cel, comments: @dueno.comments, email: @dueno.email, first_name: @dueno.first_name, last_name: @dueno.last_name, property_id: @dueno.property_id, tel: @dueno.tel } }
    assert_redirected_to dueno_url(@dueno)
  end

  test "should destroy dueno" do
    assert_difference('Dueno.count', -1) do
      delete dueno_url(@dueno)
    end

    assert_redirected_to duenos_url
  end
end
