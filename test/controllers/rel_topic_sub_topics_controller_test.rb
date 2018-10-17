require 'test_helper'

class RelTopicSubTopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rel_topic_sub_topic = rel_topic_sub_topics(:one)
  end

  test "should get index" do
    get rel_topic_sub_topics_url, as: :json
    assert_response :success
  end

  test "should create rel_topic_sub_topic" do
    assert_difference('RelTopicSubTopic.count') do
      post rel_topic_sub_topics_url, params: { rel_topic_sub_topic: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show rel_topic_sub_topic" do
    get rel_topic_sub_topic_url(@rel_topic_sub_topic), as: :json
    assert_response :success
  end

  test "should update rel_topic_sub_topic" do
    patch rel_topic_sub_topic_url(@rel_topic_sub_topic), params: { rel_topic_sub_topic: {  } }, as: :json
    assert_response 200
  end

  test "should destroy rel_topic_sub_topic" do
    assert_difference('RelTopicSubTopic.count', -1) do
      delete rel_topic_sub_topic_url(@rel_topic_sub_topic), as: :json
    end

    assert_response 204
  end
end
