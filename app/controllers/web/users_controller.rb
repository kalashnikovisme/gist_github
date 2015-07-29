class Web::UsersController < ApplicationController
  def new
    @user_form = UserForm.new_with_model
  end

  def create
    @user_form = UserForm.new_with_model
    @user_form.submit params[:user]
    if @user_form.save
      sign_in @user_form.model
      redirect_to root_path
    else
      render action: :new
    end
  end
end
