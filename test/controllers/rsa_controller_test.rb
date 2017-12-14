require 'test_helper'

class RsaControllerTest < ActionDispatch::IntegrationTest
  test "should get cretae" do
    get rsa_cretae_url
    assert_response :success
  end

  test "should get show" do
    get rsa_show_url
    assert_response :success
  end

end
