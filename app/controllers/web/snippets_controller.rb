class Web::SnippetsController < Web::ApplicationController
  def index
    @snippets = Snippet.all.page params[:page]
  end

  def show
    @snippet = Snippet.find params[:id]
  end
end
