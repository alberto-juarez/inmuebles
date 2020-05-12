require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contacto" do
    get static_pages_contacto_url
    assert_response :success
  end

  test "should get nosotros" do
    get static_pages_nosotros_url
    assert_response :success
  end

end
