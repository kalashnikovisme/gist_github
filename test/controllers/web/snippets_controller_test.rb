require 'test_helper'

class Web::SnippetsControllerTest < ActionController::TestCase
  setup do
    create :user
    @snippet = create :snippet
  end

  test 'should get index' do
    get :index
    assert_response :success, @response.body
  end

  test 'should get show' do
    get :show, id: @snippet
    assert_response :success, @response.body
  end
end
