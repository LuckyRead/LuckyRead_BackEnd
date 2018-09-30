require 'test_helper'

class SubtopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subtopic = subtopics(:one)
  end

  test "should get index" do
    get subtopics_url, as: :json
    assert_response :success
  end

  test "should create subtopic" do
    assert_difference('Subtopic.count') do
      post subtopics_url, params: { subtopic: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show subtopic" do
    get subtopic_url(@subtopic), as: :json
    assert_response :success
  end

  test "should update subtopic" do
    patch subtopic_url(@subtopic), params: { subtopic: {  } }, as: :json
    assert_response 200
  end

  test "should destroy subtopic" do
    assert_difference('Subtopic.count', -1) do
      delete subtopic_url(@subtopic), as: :json
    end

    assert_response 204
  end
end
