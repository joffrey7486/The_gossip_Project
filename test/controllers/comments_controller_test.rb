require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get content:text" do
    get comments_content:text_url
    assert_response :success
  end

end
