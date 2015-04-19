class UserMailer < ActionMailer::Base
  default from: "no-reply@shop.com"

  def activation_needed_email(user)
    @user = user
    @url = activate_api_user_url(user.activation_token)
    mail(
      to:      user.email,
      subject: t('mailer.activation_needed_email.subject')
    )
  end

  def reset_password_email(user)
    @user = user
    @url = URI::join(root_url, "/new_password/#{user.reset_password_token}")
    mail(
      to:      user.email,
      subject: t('mailer.reset_password_email.subject')
    )
  end

end
