class Web::Admin::SnippetsController < Web::Admin::ApplicationController
  def index
    @snippets = Snippet.all.page params[:page]
  end

  def new
    @snippet_form = SnippetForm.new_with_model
  end

  def edit
    @snippet_form = SnippetForm.find_with_model params[:id]
  end

  def create
    @snippet_form = SnippetForm.new_with_model
    @snippet_form.submit params[:snippet]
    if @snippet_form.save
      redirect_to admin_snippets_path
    else
      render action: :new
    end
  end

  def update
    @snippet_form = SnippetForm.find_with_model params[:id]
    @snippet_form.submit params[:snippet]
    if @snippet_form.save
      redirect_to edit_admin_snippet_path @snippet_form.model
    else
      render action: :edit
    end
  end

  def destroy
    @snippet = Snippet.find params[:id]
    @snippet.destroy
    redirect_to admin_snippets_path
  end
end
