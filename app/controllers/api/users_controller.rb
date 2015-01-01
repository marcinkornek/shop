class Api::UsersController < ApplicationController
  before_action :current_user?, only:   [:update, :destroy]
  before_action :require_login, except: [:create, :activate, :show, :check_if_unique]
  before_action :check_if_admin, except: [:create, :activate, :show, :update, :check_if_unique]

  def index
    @users = User.all.order(created_at: :desc).extend(ListUsersRepresenter)
    render json: @users
  end

  def create
    @user = User.new(user_create_params)
    user.send_activation_email = true
    if @user.save
      @user = User.find(@user.id)
      @user.extend(ListUserRepresenter)
      render json: {user: @user.to_hash}
    else
      render json: @user.errors, status: :not_acceptable
    end
  end

  def show
    show_user = if current_user.role == 'Admin'
      user.extend(UserRepresenter)
    else
      user
    end
    render json: show_user
  end

  def update
    if user.update_attributes(user_params)
      render json: user.extend(HeaderUserRepresenter)
    else
      render json: user.errors, status: :not_acceptable
    end
  end

  def destroy
    render json: user.destroy
  end

  def check_if_unique
    if User.where(params['key'] => params['value']).exists?
      render json: {error: 'unique: false'}, status: :not_acceptable
    else
      render json: {unique: true}
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to root_path(:anchor => '/session/new')
    else
      not_authenticated
    end
  end

  ###################################################

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :tel_num, :birth_date)
  end

  def user_create_params
    params.permit(:first_name, :last_name, :email, :tel_num, :birth_date, :password, :password_confirmation, :provider, :uid, :friendly_token)
  end

  def user
    @user ||= current_user
  end

  def admin_user
    @user ||= User.find(params[:id])
  end

end

