class Api::SessionsController < ApplicationController

  def create
    if @user = login(params[:email].downcase, params[:password], params[:remember])
      @user = User.find(@user.id)
      @user
      render json: {user: @user}
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.activation_state != 'active'
        render json: {
          error: {message: "ACTIVATE_EMAIL_DANGER"}
        }, status: :not_acceptable
      elsif @user && @user.provider
        render json: {
          error: {message: "REGISTER_WITH_OMNIAUTH_DANGER", variable: @user.provider}
        }, status: :not_acceptable
      else
        render json: {
          error: {message: "WRONG_EMAIL_PASSWORD_DANGER"}
        }, status: :not_acceptable
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
