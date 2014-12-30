require 'spec_helper'

describe Address, focus:true do

  before do
    @address = FactoryGirl.create(:address)
  end

  it { expect(@address).to respond_to(:first_name) }
  it { expect(@address).to respond_to(:last_name) }
  it { expect(@address).to respond_to(:tel_num) }
  it { expect(@address).to respond_to(:street) }
  it { expect(@address).to respond_to(:house_num) }
  it { expect(@address).to respond_to(:town) }
  it { expect(@address).to respond_to(:postcode) }
  it { expect(@address).to respond_to(:user) }

  it { expect(@address).to be_valid }

  describe "when first_name" do
    context "is not present" do
      before { @address.first_name = ''}
      it { expect(@address).not_to be_valid }
    end

    context "is too short" do
      before { @address.first_name = "a" * 2 }
      it { expect(@address).not_to be_valid }
    end

    context "is too long" do
      before { @address.first_name = "a" * 31 }
      it { expect(@address).not_to be_valid }
    end

    context "format is valid" do
      it "should be valid" do
        names = ["Mathias", "Martin Jr.", "Hector", "Łukasz"]
        names.each do |valid_name|
          @address.first_name = valid_name
          expect(@address).to be_valid
        end
      end
    end

    context "format is invalid" do
      it "should be invalid" do
        names = ["Mathias d1Arras", "Stev3 Smith", "Steve Sm1th"]
        names.each do |invalid_name|
          @address.first_name = invalid_name
          expect(@address).not_to be_valid
        end
      end
    end

    context "is with mixed case" do
      let(:mixed_case_first_name) { "aDaM" }
      it "should be saved as capitalize" do
        @address.first_name = mixed_case_first_name
        @address.save
        expect(@address.reload.first_name).to eq mixed_case_first_name.capitalize
      end
    end
  end


  describe "when last_name" do
    context "is not present" do
      before { @address.last_name = ''}
      it { expect(@address).not_to be_valid }
    end

    context "is too short" do
      before { @address.last_name = "a" * 2 }
      it { expect(@address).not_to be_valid }
    end

    context "is too long" do
      before { @address.last_name = "a" * 31 }
      it { expect(@address).not_to be_valid }
    end

    context "format is valid" do
      it "should be valid" do
        names = ["d'Arras", "Luther King", "Sausage-Hausen", "B-Ball Basketball", "Bżęczyszczykiewicz"]
        names.each do |valid_name|
          @address.first_name = valid_name
          expect(@address).to be_valid
        end
      end
    end

    context "format is invalid" do
      it "should be invalid" do
        names = ["d1Arras", "Steve Sm1th"]
        names.each do |invalid_name|
          @address.first_name = invalid_name
          expect(@address).not_to be_valid
        end
      end
    end

    context "is with mixed case" do
      let(:mixed_case_last_name) { "aDaM" }
      it "should be saved as capitalize" do
        @address.last_name = mixed_case_last_name
        @address.save
        expect(@address.reload.last_name).to eq mixed_case_last_name.capitalize
      end
    end
  end


  describe "when tel_num" do
    context "is not present" do
      before { @address.tel_num = ''}
      it { expect(@address).not_to be_valid }
    end

    context "is wrong" do
      before { @address.tel_num = "1" * 8 }
      it { expect(@address).not_to be_valid }
    end

    context "is too long" do
      before { @address.tel_num = "1" * 10 }
      it { expect(@address).not_to be_valid }
    end

    context "format is invalid" do
      it "should be invalid" do
        numbers = ["888-111-222", "888 111 222"]
        numbers.each do |invalid_number|
          @address.tel_num = invalid_number
          expect(@address).not_to be_valid
        end
      end
    end

    context "format is valid" do
      it "should be valid" do
        valid_number = '888111222'
        @address.tel_num = valid_number
        expect(@address).to be_valid
      end
    end
  end


  describe "when street" do
    context "is not present" do
      before { @address.street = ''}
      it { expect(@address).not_to be_valid }
    end

    context "is too short" do
      before { @address.street = "1" * 2 }
      it { expect(@address).not_to be_valid }
    end

    context "is too long" do
      before { @address.street = "1" * 41 }
      it { expect(@address).not_to be_valid }
    end
  end


  describe "when house_num" do
    context "is not present" do
      before { @address.house_num = ''}
      it { expect(@address).not_to be_valid }
    end

    context "is too long" do
      before { @address.house_num = "1" * 10 }
      it { expect(@address).not_to be_valid }
    end

    context "format is invalid" do
      it "should be invalid" do
        numbers = ["888--111", "888 1", "999/11111", "12m2", "55 m 2", "aaa-aaa", "111-aaa"]
        numbers.each do |invalid_number|
          @address.house_num = invalid_number
          expect(@address).not_to be_valid
        end
      end
    end

    context "format is valid" do
      it "should be valid" do
        numbers = ["888-111", "888/1", "1111-2222", "3333-1111", "33a", "33a-11z", "11c/11c"]
        numbers.each do |valid_number|
          @address.house_num = valid_number
          expect(@address).to be_valid
        end
      end
    end
  end


  describe "when town" do
    context "is not present" do
      before { @address.town = ''}
      it { expect(@address).not_to be_valid }
    end

    context "is too short" do
      before { @address.town = "a" * 2 }
      it { expect(@address).not_to be_valid }
    end

    context "is too long" do
      before { @address.town = "a" * 41 }
      it { expect(@address).not_to be_valid }
    end
  end


  describe "when postcode" do
    context "is not present" do
      before { @address.postcode = ''}
      it { expect(@address).not_to be_valid }
    end

    context "is too short" do
      before { @address.postcode = "1" * 5 }
      it { expect(@address).not_to be_valid }
    end

    context "is too long" do
      before { @address.postcode = "1" * 7 }
      it { expect(@address).not_to be_valid }
    end

    context "format is invalid" do
      it "should be invalid" do
        numbers = ["888-111", "888 1", "99-91-1", "132-32", "11-a11"]
        numbers.each do |invalid_postcode|
          @address.postcode = invalid_postcode
          expect(@address).not_to be_valid
        end
      end
    end

    context "format is valid" do
      it "should be valid" do
        numbers = ["11-111", "99-111"]
        numbers.each do |valid_postcode|
          @address.postcode = valid_postcode
          expect(@address).to be_valid
        end
      end
    end
  end

end
