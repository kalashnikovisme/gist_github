class Web::SnippetsController < Web::ApplicationController
  before_filter :add_comment, only: :show

  def index
    @snippets = Snippet.all.page params[:page]
  end

  def show
    @snippet = Snippet.find params[:id]
  end
end
