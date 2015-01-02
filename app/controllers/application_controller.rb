class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include JsEnv

  def check_if_admin
    if current_user.role.downcase != 'admin'
      render json: {error: 'admin: false'}, status: :not_acceptable
    end
  end

end
