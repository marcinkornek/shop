class UserMailer < ActionMailer::Base
  default from: "no-reply@shop.com"

  def activation_needed_email(user)
    @user = user
    @url = activate_api_user_url(user.activation_token)
    mail(:to => user.email,
         :subject => "Witamy na naszej super stronie"
        )
  end

  def reset_password_email(user)
    @user = user
    @url = URI::join(root_url, "/new_password/#{user.reset_password_token}")
    mail(:to => user.email,
         :subject => "Your password has been reset")
  end

end
