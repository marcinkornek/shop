class Api::OrdersController < ApplicationController
  def index
    orders = current_user.orders.order(updated_at: :desc)
    render json: orders
  end

  def create
    p '-----------------'
    p params
    p '-----------------'
  end
end

