require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest
  
  test "sign up a new user" do
    get "/signup"
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {username: "johndoe", email: "johndoe@example.com",
        password: "password"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "johndoe", response.body #name shows in html body
  end

end