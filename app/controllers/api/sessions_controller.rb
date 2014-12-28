class Api::SessionsController < ApplicationController

  def create
    if @user = login(params[:email].downcase, params[:password], params[:remember])
      @user = User.find(@user.id)
      @user
      render json: {user: @user.to_hash}
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.activation_state != 'active'
        render json: {error: t('session_controller.activate_email')}, status: :not_acceptable
      else
        render json: {error: t('session_controller.wrong_email_password')}, status: :not_acceptable
      end
    end
  end

  def destroy
    logout
    render json: {token: form_authenticity_token}
  end

  def oauth
    user = User.find_for_oauth(request.env["omniauth.auth"])
    auto_login(user)
    redirect_to root_path
  end

end
