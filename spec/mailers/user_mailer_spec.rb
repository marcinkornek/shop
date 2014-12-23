require "spec_helper"

describe UserMailer do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "#activation_needed_email" do
    let(:mail) { UserMailer.activation_needed_email(@user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Witamy na naszej super stronie")
      expect(mail.to).to      eq([@user.email])
      expect(mail.from).to    eq(["no-reply@shop.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Witamy na stronie, #{@user.first_name} #{@user.last_name}")
      expect(mail.body.encoded).to match("Żeby potwierdzić rejestrację i zalogować się na stronie kliknij w link: #{activate_api_user_url(@user.activation_token)}")
    end
  end

end
