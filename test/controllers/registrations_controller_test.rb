require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get soft_delete" do
    get registrations_soft_delete_url
    assert_response :success
  end
end
