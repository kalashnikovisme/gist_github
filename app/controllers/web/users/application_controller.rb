class Web::Users::ApplicationController < Web::ApplicationController
  before_filter :authenticate_user!

  protected

  def current_user_object?(object)
    object.user_id == current_user.id
  end
end
