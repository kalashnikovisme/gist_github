class Web::UsersController < ApplicationController
  def new
    @user_form = UserForm.new_with_model
  end

  def create
    @user_form = UserForm.new_with_model
    @user_form.submit params[:user]
    if @user_form.save
      redirect_to admin_users_path
    else
      render action: :new
    end
  end
end
