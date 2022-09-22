require 'test_helper'

class UserSignUpTest < ActionDispatch::IntegrationTest

  test "get sign up new user test" do
    get "/signup"
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "Shiranui", email: "Shiranui@kof.com", password: "123456" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Shiranui", response.body
  end
end
