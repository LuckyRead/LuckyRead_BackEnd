require 'test_helper'

class FragmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fragment = fragments(:one)
  end

  test "should get index" do
    get fragments_url, as: :json
    assert_response :success
  end

  test "should create fragment" do
    assert_difference('Fragment.count') do
      post fragments_url, params: { fragment: { content: @fragment.content, idfragment: @fragment.idfragment, introduction: @fragment.introduction, score: @fragment.score, source: @fragment.source, title: @fragment.title } }, as: :json
    end

    assert_response 201
  end

  test "should show fragment" do
    get fragment_url(@fragment), as: :json
    assert_response :success
  end

  test "should update fragment" do
    patch fragment_url(@fragment), params: { fragment: { content: @fragment.content, idfragment: @fragment.idfragment, introduction: @fragment.introduction, score: @fragment.score, source: @fragment.source, title: @fragment.title } }, as: :json
    assert_response 200
  end

  test "should destroy fragment" do
    assert_difference('Fragment.count', -1) do
      delete fragment_url(@fragment), as: :json
    end

    assert_response 204
  end
end
