require 'test_helper'

class Web::Admin::SnippetsControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    sign_in admin
    @snippet = create :snippet
  end

  test 'should get index' do
    get :index
    assert_response :success, @response.body
  end

  test 'should get new' do
    get :new
    assert_response :success, @response.body
  end

  test 'should create snippet' do
    attributes = attributes_for :snippet
    post :create, snippet: attributes
    assert_response :redirect, @response.body
    assert_redirected_to admin_snippets_path
    assert_equal attributes[:title], Snippet.last.title
  end

  test 'should get edit' do
    get :edit, id: @snippet
    assert_response :success, @response.body
  end

  test 'should patch update' do
    attributes = attributes_for :snippet
    patch :update, snippet: attributes, id: @snippet
    assert_response :redirect, @response.body
    assert_redirected_to edit_admin_snippet_path @snippet
    @snippet.reload
    assert_equal attributes[:title], @snippet.title
  end

  test 'should delete destroy' do
    count = Snippet.count
    delete :destroy, id: @snippet
    assert_equal count - 1, Snippet.count
  end
end
