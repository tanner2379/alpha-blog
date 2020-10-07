require 'test_helper'

class NewArticleTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = User.create(username: "johndoe", email: "johndoe@example.com",
    password: "password")
    sign_in_as(@user)
  end
  
  test "create a new article" do
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: {article: {title: "Some Title", description: "Some Description", user_id: @user.id }}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Some Title", response.body #name shows in html body
  end

end