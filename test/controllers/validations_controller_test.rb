require "test_helper"

class ValidationsControllerTest < ActionDispatch::IntegrationTest
  test "get new" do
    get new_validation_path
    assert_response :success
  end

  test "post create redirects" do
    # This just tests redirect
    post validations_path, params: { social_security_number: "200001011234" }

    assert_response :redirect
    assert_redirected_to new_validation_path
  end

  test "post create with empty number redirects to root" do
    post validations_path, params: { social_security_number: "" }

    assert_response :redirect
    assert_redirected_to root_path
  end
end
