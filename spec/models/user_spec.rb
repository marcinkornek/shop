require 'rails_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user)
  end

  it { expect(@user).to respond_to(:first_name) }
  it { expect(@user).to respond_to(:last_name) }
  it { expect(@user).to respond_to(:tel_num) }
  it { expect(@user).to respond_to(:birth_date) }
  it { expect(@user).to respond_to(:email) }
  it { expect(@user).to respond_to(:password) }
  it { expect(@user).to respond_to(:password_confirmation) }
  it { expect(@user).to respond_to(:provider) }
  it { expect(@user).to respond_to(:uid) }
  it { expect(@user).to respond_to(:addresses) }

  it { expect(@user).to be_valid }

  describe "when email" do
    context "is not present" do
      before { @user.email = '' }
      it { expect(@user).not_to be_valid }
    end

    context "is already taken" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.save
        @user.save
      end
      it { should_not be_valid }
    end

    context "is with mixed case" do
      let(:mixed_case_email) { "Foo@ExAMPle.CoM" }
      it "should be saved as all lower-case" do
        @user.email = mixed_case_email
        @user.save
        expect(@user.reload.email).to eq mixed_case_email.downcase
      end
    end

    context "format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com foo@bar..com]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end
    end

    context "format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end
    end
  end

  describe "when first_name" do
    context "is not present" do
      before { @user.first_name = '' }
      it { expect(@user).not_to be_valid }
    end

    context "is too short" do
      before { @user.first_name = "a" * 2 }
      it { expect(@user).not_to be_valid }
    end

    context "is too long" do
      before { @user.first_name = "a" * 31 }
      it { expect(@user).not_to be_valid }
    end

    context "format is valid" do
      it "should be valid" do
        names = ["Mathias", "Martin Jr.", "Hector", "Łukasz"]
        names.each do |valid_name|
          @user.first_name = valid_name
          expect(@user).to be_valid
        end
      end
    end

    context "format is invalid" do
      it "should be invalid" do
        names = ["Mathias d1Arras", "Stev3 Smith", "Steve Sm1th"]
        names.each do |invalid_name|
          @user.first_name = invalid_name
          expect(@user).not_to be_valid
        end
      end
    end

    context "is with mixed case" do
      let(:mixed_case_first_name) { "aDaM adam" }
      it "should be saved as capitalize_words" do
        @user.first_name = mixed_case_first_name
        @user.save
        expect(@user.reload.first_name).to eq mixed_case_first_name.capitalize_words
      end
    end
  end

  describe "when last_name" do
    context "is not present" do
      before { @user.last_name = '' }
      it { expect(@user).not_to be_valid }
    end

    context "is too short" do
      before { @user.last_name = "a" * 2 }
      it { expect(@user).not_to be_valid }
    end

    context "is too long" do
      before { @user.last_name = "a" * 31 }
      it { expect(@user).not_to be_valid }
    end

    context "format is valid" do
      it "should be valid" do
        names = [
          "d'Arras",
          "Luther King",
          "Sausage-Hausen",
          "B-Ball Basketball",
          "Bżęczyszczykiewicz"
        ]
        names.each do |valid_name|
          @user.first_name = valid_name
          expect(@user).to be_valid
        end
      end
    end

    context "format is invalid" do
      it "should be invalid" do
        names = ["d1Arras", "Steve Sm1th"]
        names.each do |invalid_name|
          @user.first_name = invalid_name
          expect(@user).not_to be_valid
        end
      end
    end

    context "is with mixed case" do
      let(:mixed_case_last_name) { "aDaM adam" }
      it "should be saved as capitalize_words" do
        @user.last_name = mixed_case_last_name
        @user.save
        expect(@user.reload.last_name).to eq mixed_case_last_name.capitalize_words
      end
    end
  end

  describe "when tel_num" do
    context "is not present" do
      before { @user.tel_num = '' }
      it { expect(@user).to be_valid }
    end

    context "is wrong" do
      before { @user.tel_num = "1" * 8 }
      it { expect(@user).not_to be_valid }
    end

    context "is too long" do
      before { @user.tel_num = "1" * 10 }
      it { expect(@user).not_to be_valid }
    end

    context "format is invalid" do
      it "should be invalid" do
        numbers = ["888-111-222", "888 111 222"]
        numbers.each do |invalid_number|
          @user.tel_num = invalid_number
          expect(@user).not_to be_valid
        end
      end
    end

    context "format is valid" do
      it "should be valid" do
        valid_number = '888111222'
        @user.tel_num = valid_number
        expect(@user).to be_valid
      end
    end
  end

  describe "when birth_date" do
    context "is not present" do
      before { @user.birth_date = '' }
      it { expect(@user).to be_valid }
    end
  end

  describe "when password" do
    context "is not present" do
      before { @user.password = '' }
      it { expect(@user).not_to be_valid }
    end

    context "is too short" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { expect(@user).not_to be_valid }
    end

    context "doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { expect(@user).not_to be_valid }
    end
  end
end
