require 'test_helper'

class RelFragmentSubTopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rel_fragment_sub_topic = rel_fragment_sub_topics(:one)
  end

  test "should get index" do
    get rel_fragment_sub_topics_url, as: :json
    assert_response :success
  end

  test "should create rel_fragment_sub_topic" do
    assert_difference('RelFragmentSubTopic.count') do
      post rel_fragment_sub_topics_url, params: { rel_fragment_sub_topic: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show rel_fragment_sub_topic" do
    get rel_fragment_sub_topic_url(@rel_fragment_sub_topic), as: :json
    assert_response :success
  end

  test "should update rel_fragment_sub_topic" do
    patch rel_fragment_sub_topic_url(@rel_fragment_sub_topic), params: { rel_fragment_sub_topic: {  } }, as: :json
    assert_response 200
  end

  test "should destroy rel_fragment_sub_topic" do
    assert_difference('RelFragmentSubTopic.count', -1) do
      delete rel_fragment_sub_topic_url(@rel_fragment_sub_topic), as: :json
    end

    assert_response 204
  end
end
