require "spec_helper"

describe UserMailer do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "#activation_needed_email" do
    let(:mail) { UserMailer.activation_needed_email(@user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Aktywacja konta")
      expect(mail.to).to      eq([@user.email])
      expect(mail.from).to    eq(["no-reply@shop.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Witamy, #{@user.first_name} #{@user.last_name}")
      expect(mail.body.encoded).to match("Żeby potwierdzić rejestrację i zalogować się na stronie kliknij w link: #{activate_api_user_url(@user.activation_token)}")
    end
  end

  describe "#reset_password_email" do
    let(:mail) { @user.deliver_reset_password_instructions! }

    it "renders the headers" do
      expect(mail.subject).to eq("Twoje hasło zostało zresetowane")
      expect(mail.to).to      eq([@user.email])
      expect(mail.from).to    eq(["no-reply@shop.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Witamy, #{@user.first_name} #{@user.last_name}")
      expect(mail.body.encoded).to match("Zażądano, aby zresetować hasło.")
      expect(mail.body.encoded).to match("Żeby wybrać nowe hasło, kliknij w link: http://localhost:3000/new_password/#{@user.reset_password_token}")
      expect(mail.body.encoded).to match("Życzymy miłego dnia!")
    end
  end

end
