require 'rails_helper'

describe OrderDetail do
  before do
    @order_detail = FactoryGirl.create(:order_detail)
  end

  it { expect(@order_detail).to respond_to(:price) }
  it { expect(@order_detail).to respond_to(:amount) }
  it { expect(@order_detail).to respond_to(:order) }
  it { expect(@order_detail).to respond_to(:product_size) }

  it { expect(@order_detail).to be_valid }

  describe "when price" do
    context "is not present" do
      before { @order_detail.price = '' }
      it { expect(@order_detail).not_to be_valid }
    end
    context "is smaller than 0" do
      before { @order_detail.price = -1 }
      it { expect(@order_detail).not_to be_valid }
    end
    context "is greater than 0" do
      before { @order_detail.price = 1 }
      it { expect(@order_detail).to be_valid }
    end
  end

  describe "when amount" do
    context "is not present" do
      before { @order_detail.amount = '' }
      it { expect(@order_detail).not_to be_valid }
    end
    context "is smaller than 0" do
      before { @order_detail.amount = -1 }
      it { expect(@order_detail).not_to be_valid }
    end
    context "is greater than 0" do
      before { @order_detail.amount = 1 }
      it { expect(@order_detail).to be_valid }
    end
  end

  describe "when order" do
    context "is not present" do
      before { @order_detail.order = nil }
      it { expect(@order_detail).not_to be_valid }
    end
  end

  describe "when product_size" do
    context "is not present" do
      before { @order_detail.product_size = nil }
      it { expect(@order_detail).not_to be_valid }
    end
  end
end
