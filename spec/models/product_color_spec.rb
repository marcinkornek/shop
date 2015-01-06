require 'spec_helper'

describe ProductColor do

  before do
    @product_col = FactoryGirl.create(:product_color)
  end

  it { expect(@product_col).to respond_to(:color) }
  it { expect(@product_col).to respond_to(:image) }
  it { expect(@product_col).to respond_to(:product) }
  it { expect(@product_col).to respond_to(:product_sizes) }

  it { expect(@product_col).to be_valid }

  describe "when color" do
    context "is not present" do
      before { @product_col.color = ''}
      it { expect(@product_col).not_to be_valid }
    end
  end


  describe "when image" do
    context "is not present" do
      before { @product_col.remove_image! }
      it { expect(@product_col).not_to be_valid }
    end
  end


  describe "when product" do
    context "is not present" do
      before { @product_col.product = nil }
      it { expect(@product_col).not_to be_valid }
    end
  end

end
