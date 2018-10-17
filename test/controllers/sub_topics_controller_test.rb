require 'test_helper'

class SubTopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_topic = sub_topics(:one)
  end

  test "should get index" do
    get sub_topics_url, as: :json
    assert_response :success
  end

  test "should create sub_topic" do
    assert_difference('SubTopic.count') do
      post sub_topics_url, params: { sub_topic: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show sub_topic" do
    get sub_topic_url(@sub_topic), as: :json
    assert_response :success
  end

  test "should update sub_topic" do
    patch sub_topic_url(@sub_topic), params: { sub_topic: {  } }, as: :json
    assert_response 200
  end

  test "should destroy sub_topic" do
    assert_difference('SubTopic.count', -1) do
      delete sub_topic_url(@sub_topic), as: :json
    end

    assert_response 204
  end
end
