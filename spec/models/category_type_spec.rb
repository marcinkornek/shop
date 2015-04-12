require 'rails_helper'

describe CategoryType do

  before do
    @category_type = FactoryGirl.create(:category_type)
  end

  it { expect(@category_type).to respond_to(:name) }
  it { expect(@category_type).to respond_to(:main_category) }
  it { expect(@category_type).to respond_to(:categories) }

  it { expect(@category_type).to be_valid }

  describe "when name" do
    context "is not present" do
      before { @category_type.name = ''}
      it { expect(@category_type).not_to be_valid }
    end
  end

end
