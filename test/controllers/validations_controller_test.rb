require "test_helper"

class ValidationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get validations_new_url
    assert_response :success
  end

  test "should get create" do
    get validations_create_url
    assert_response :success
  end
end
