class Api::AddressesController < ApplicationController
  before_action :require_login, except: [:create, :activate, :show, :check_if_unique]

  def index
    @addresses = current_user.addresses
    render json: @addresses
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    if @address.save
      render json: @address
    else
      render json: @address.errors, status: :not_acceptable
    end
  end

  def show
    # p '--------address---------'
    # p address
    # p '--------address---------'
    render json: address
  end

  def update
    if address.update_attributes(address_params)
      render json: @address
    else
      render json: @address.errors, status: :not_acceptable
    end
  end

  def destroy
    render json: address.destroy
  end

  ###################################################

  private

  def address_params
    params.permit(:first_name, :last_name, :tel_num, :street, :house_num, :town, :postcode)
  end

  def address
    @address ||= current_user.addresses.find(params[:id])
  end

end

