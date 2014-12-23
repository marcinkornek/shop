class UserMailer < ActionMailer::Base
  default from: "no-reply@shop.com"

  def activation_needed_email(user)
    @user = user
    @url = activate_api_user_url(user.activation_token)
    mail(:to => user.email,
         :subject => "Witamy na naszej super stronie"
        )
  end

end
