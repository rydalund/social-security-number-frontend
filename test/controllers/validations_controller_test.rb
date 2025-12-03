require "test_helper"

class ValidationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_validation_path
    assert_response :success
  end

  test "should post create" do
    post validations_path, params: { social_security_number: "200001011234" }
    assert_response :success
  end
end
