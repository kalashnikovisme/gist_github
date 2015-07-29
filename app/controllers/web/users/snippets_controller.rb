class Web::Users::SnippetsController < Web::Users::ApplicationController
  def index
    @snippets = current_user.snippets.page params[:page]
  end

  def show
    @snippet = Snippet.find params[:id]
    redirect_to root_path unless current_user_object? @snippet
  end

  def new
    @snippet_form = SnippetForm.new_with_model
  end

  def edit
    @snippet_form = SnippetForm.find_with_model params[:id]
  end

  def create
    @snippet_form = SnippetForm.new_with_model
    params[:snippet][:user_id] = current_user.id
    @snippet_form.submit params[:snippet]
    if @snippet_form.save
      redirect_to users_snippets_path
    else
      render action: :new
    end
  end

  def update
    @snippet_form = SnippetForm.find_with_model params[:id]
    @snippet_form.submit params[:snippet]
    if @snippet_form.save
      redirect_to edit_users_snippet_path @snippet_form.model
    else
      render action: :edit
    end
  end

  def destroy
    @snippet = Snippet.find params[:id]
    @snippet.destroy
    redirect_to users_snippets_path
  end
end
