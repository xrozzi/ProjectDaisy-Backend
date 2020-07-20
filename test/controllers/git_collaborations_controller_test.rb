require 'test_helper'

class GitCollaborationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @git_collaboration = git_collaborations(:one)
  end

  test "should get index" do
    get git_collaborations_url, as: :json
    assert_response :success
  end

  test "should create git_collaboration" do
    assert_difference('GitCollaboration.count') do
      post git_collaborations_url, params: { git_collaboration: { description: @git_collaboration.description, title: @git_collaboration.title } }, as: :json
    end

    assert_response 201
  end

  test "should show git_collaboration" do
    get git_collaboration_url(@git_collaboration), as: :json
    assert_response :success
  end

  test "should update git_collaboration" do
    patch git_collaboration_url(@git_collaboration), params: { git_collaboration: { description: @git_collaboration.description, title: @git_collaboration.title } }, as: :json
    assert_response 200
  end

  test "should destroy git_collaboration" do
    assert_difference('GitCollaboration.count', -1) do
      delete git_collaboration_url(@git_collaboration), as: :json
    end

    assert_response 204
  end
end
