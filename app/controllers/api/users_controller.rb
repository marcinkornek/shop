# rubocop:disable Metrics/ClassLength
class Api::UsersController < ApplicationController
  # rubocop:disable Metrics/LineLength
  before_action :require_login, except: [:create, :activate, :show, :check_if_unique, :reset_password, :set_new_password]
  before_action :check_if_admin, except: [:create, :activate, :show, :update, :check_if_unique, :reset_password, :set_new_password]
  # rubocop:enable Metrics/LineLength

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
    show_user =
      if current_user.role == 'Admin'
        admin_user
      else
        user
      end
    # p '---------user--------'
    # p show_user
    # p '---------user--------'
    render json: {
      user: show_user,
      addresses_number: show_user.addresses.size,
      addresses: show_user.addresses.order(:created_at)
    }
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
    user_id = current_user.try(:id)
    if User.where('email = ?', params['value']).where.not(id: user_id).exists?
      render json: {error: 'unique: false'}, status: :not_acceptable
    else
      render json: {unique: true}
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to root_path(anchor: '/session/new')
    else
      not_authenticated
    end
  end

  def change_password
    if User.authenticate(current_user.email, user_change_password_params[:old_password])
      current_user.change_password!(user_change_password_params[:new_password])
      render json: {}
    else
      render json: {error: 'old_password: wrong'}, status: :not_acceptable
    end
  end

  def reset_password
    @user = User.find_by_email(params[:email])
    if @user && !@user.provider
      @user.deliver_reset_password_instructions! if @user
      render json: {}
    elsif @user && @user.provider
      render json: {
        error: {message: "REGISTER_WITH_OMNIAUTH_DANGER", variable: @user.provider}
      }, status: :not_acceptable
    else
      render json: {}
    end
  end

  def set_new_password
    @token = params[:token]
    @user = User.load_from_reset_password_token(@token)
    p '-----------------'
    p @user
    p '-----------------'
    if @user
      # the next line makes the password confirmation validation work
      @user.password_confirmation = params[:password_confirmation]
      # the next line clears the temporary token and updates the password
      render json: @user if @user.change_password!(params[:password])
    else
      render json: {
        error: {message: 'PASSWORD_RESET_ALERT_DANGER'}
      }, status: :not_acceptable
    end
  end

  ###################################################

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :tel_num, :birth_date)
  end

  def user_create_params
    params.permit(
      :first_name, :last_name, :email, :tel_num, :birth_date,
      :password, :password_confirmation, :provider, :uid, :friendly_token
    )
  end

  def user_change_password_params
    params.permit(:old_password, :new_password, :new_password_confirmation)
  end

  def user
    @user ||= current_user
  end

  def admin_user
    @user ||= User.find(params[:id])
  end
end
