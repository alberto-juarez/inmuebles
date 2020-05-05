require 'test_helper'

class ProspectosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prospecto = prospectos(:one)
  end

  test "should get index" do
    get prospectos_url
    assert_response :success
  end

  test "should get new" do
    get new_prospecto_url
    assert_response :success
  end

  test "should create prospecto" do
    assert_difference('Prospecto.count') do
      post prospectos_url, params: { prospecto: { comment: @prospecto.comment, email: @prospecto.email, first_name: @prospecto.first_name, last_name: @prospecto.last_name, status: @prospecto.status, statuscomment: @prospecto.statuscomment, tel: @prospecto.tel } }
    end

    assert_redirected_to prospecto_url(Prospecto.last)
  end

  test "should show prospecto" do
    get prospecto_url(@prospecto)
    assert_response :success
  end

  test "should get edit" do
    get edit_prospecto_url(@prospecto)
    assert_response :success
  end

  test "should update prospecto" do
    patch prospecto_url(@prospecto), params: { prospecto: { comment: @prospecto.comment, email: @prospecto.email, first_name: @prospecto.first_name, last_name: @prospecto.last_name, status: @prospecto.status, statuscomment: @prospecto.statuscomment, tel: @prospecto.tel } }
    assert_redirected_to prospecto_url(@prospecto)
  end

  test "should destroy prospecto" do
    assert_difference('Prospecto.count', -1) do
      delete prospecto_url(@prospecto)
    end

    assert_redirected_to prospectos_url
  end
end
