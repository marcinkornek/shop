require 'rails_helper'

describe Category do
  before do
    @category = FactoryGirl.create(:category)
  end

  it { expect(@category).to respond_to(:name) }
  it { expect(@category).to respond_to(:products) }
  it { expect(@category).to respond_to(:category_type) }

  it { expect(@category).to be_valid }

  describe "when name" do
    context "is not present" do
      before { @category.name = '' }
      it { expect(@category).not_to be_valid }
    end
  end
end
