class Web::ApplicationController < ApplicationController
  protected

  def add_comment
    @comment = Comment.new
  end
end
