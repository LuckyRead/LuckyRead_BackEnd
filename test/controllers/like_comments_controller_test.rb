require 'test_helper'

class LikeCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like_comment = like_comments(:one)
  end

  test "should get index" do
    get like_comments_url, as: :json
    assert_response :success
  end

  test "should create like_comment" do
    assert_difference('LikeComment.count') do
      post like_comments_url, params: { like_comment: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show like_comment" do
    get like_comment_url(@like_comment), as: :json
    assert_response :success
  end

  test "should update like_comment" do
    patch like_comment_url(@like_comment), params: { like_comment: {  } }, as: :json
    assert_response 200
  end

  test "should destroy like_comment" do
    assert_difference('LikeComment.count', -1) do
      delete like_comment_url(@like_comment), as: :json
    end

    assert_response 204
  end
end
