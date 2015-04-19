require 'rails_helper'

describe ProductSize do
  before do
    @product_size = FactoryGirl.create(:product_size)
  end

  it { expect(@product_size).to respond_to(:size) }
  it { expect(@product_size).to respond_to(:quantity) }
  it { expect(@product_size).to respond_to(:product_color) }

  it { expect(@product_size).to be_valid }

  describe "when size" do
    context "is not present" do
      before { @product_size.size = '' }
      it { expect(@product_size).not_to be_valid }
    end
  end


  describe "when quantity" do
    context "is not present" do
      before { @product_size.quantity = '' }
      it { expect(@product_size).not_to be_valid }
    end
  end


  describe "when product_color" do
    context "is not present" do
      before { @product_size.product_color = nil }
      it { expect(@product_size).not_to be_valid }
    end
  end
end
