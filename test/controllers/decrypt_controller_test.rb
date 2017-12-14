require 'test_helper'

class DecryptControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get decrypt_create_url
    assert_response :success
  end

end
