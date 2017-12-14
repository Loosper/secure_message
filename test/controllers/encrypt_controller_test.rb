require 'test_helper'

class EncryptControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get encrypt_create_url
    assert_response :success
  end

end
