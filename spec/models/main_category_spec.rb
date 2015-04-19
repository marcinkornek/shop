require 'rails_helper'

describe MainCategory do
  before do
    @main_category = FactoryGirl.create(:main_category)
  end

  it { expect(@main_category).to respond_to(:name) }
  it { expect(@main_category).to respond_to(:category_types) }

  it { expect(@main_category).to be_valid }

  describe "when name" do
    context "is not present" do
      before { @main_category.name = '' }
      it { expect(@main_category).not_to be_valid }
    end
  end
end
