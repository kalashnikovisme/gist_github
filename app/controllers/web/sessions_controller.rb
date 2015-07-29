class Web::SessionsController < Web::ApplicationController
  # FIXME forbid access if the user is signed in
  def new
    @user = UserForm.new_with_model
  end

  def create
    @user = User.find_by_email params[:user][:email]
    if @user
      if @user.authenticate params[:user][:password]
        sign_in @user
        redirect_to root_path
      else
        render :new
      end
    else
      @user = UserForm.new_with_model
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
