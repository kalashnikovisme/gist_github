class Web::SnippetsController < Web::ApplicationController
  def index
    @snippets = Snippet.all.page params[:page]
  end
end
