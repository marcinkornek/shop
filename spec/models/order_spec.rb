require 'spec_helper'

describe Order do

  before do
    @order = FactoryGirl.create(:order)
  end

  it { expect(@order).to respond_to(:total_price) }
  it { expect(@order).to respond_to(:state) }
  it { expect(@order).to respond_to(:user) }

  it { expect(@order).to be_valid }

  describe "when total_price" do
    context "is not present" do
      before { @order.total_price = ''}
      it { expect(@order).not_to be_valid }
    end
    context "is smaller than 0" do
      before { @order.total_price = -1}
      it { expect(@order).not_to be_valid }
    end
    context "is greater than 0" do
      before { @order.total_price = 1}
      it { expect(@order).to be_valid }
    end
  end

  describe "when state" do
    context "is not present" do
      before { @order.state = ''}
      it { expect(@order).not_to be_valid }
    end
  end

  describe "when user" do
    context "is not present" do
      before { @order.user = nil}
      it { expect(@order).not_to be_valid }
    end
  end

end
