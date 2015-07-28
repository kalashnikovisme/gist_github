require 'test_helper'

class Api::Users::CommentsControllerTest < ActionController::TestCase
  setup do
    user = create :user
    sign_in user
    @comment = create :comment
  end

  test 'should post create' do
    attributes = attributes_for :comment
    post :create, comment: attributes
    assert_response :success, @response.body
  end

  test 'should patch update' do
    attributes = attributes_for :comment
    patch :update, comment: attributes, id: @comment
    assert_response :success, @response.body
  end

  test 'should delete destroy' do
    count = Comment.count
    delete :destroy, id: @comment
    assert_equal count - 1, Comment.count
    assert_response :success, @response.body
  end
end
