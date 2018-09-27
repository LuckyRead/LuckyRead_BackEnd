require 'test_helper'

class UserFragmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_fragment = user_fragments(:one)
  end

  test "should get index" do
    get user_fragments_url, as: :json
    assert_response :success
  end

  test "should create user_fragment" do
    assert_difference('UserFragment.count') do
      post user_fragments_url, params: { user_fragment: { content: @user_fragment.content, iduserfragment: @user_fragment.iduserfragment, introduction: @user_fragment.introduction, score: @user_fragment.score, source: @user_fragment.source, state: @user_fragment.state, title: @user_fragment.title } }, as: :json
    end

    assert_response 201
  end

  test "should show user_fragment" do
    get user_fragment_url(@user_fragment), as: :json
    assert_response :success
  end

  test "should update user_fragment" do
    patch user_fragment_url(@user_fragment), params: { user_fragment: { content: @user_fragment.content, iduserfragment: @user_fragment.iduserfragment, introduction: @user_fragment.introduction, score: @user_fragment.score, source: @user_fragment.source, state: @user_fragment.state, title: @user_fragment.title } }, as: :json
    assert_response 200
  end

  test "should destroy user_fragment" do
    assert_difference('UserFragment.count', -1) do
      delete user_fragment_url(@user_fragment), as: :json
    end

    assert_response 204
  end
end
