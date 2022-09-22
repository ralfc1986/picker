require 'test_helper'

class NewArticleCreateTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "Shiranui", email: "Shiranui@kof.com", password: "123456", admin: false )
    sign_in_as(@admin_user)
  end

  test "get new article creation test" do
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "Legend of Mai", description: "Mai is the fire ring ninja", category:"Gambling" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Legend of Mai", response.body
  end
end
