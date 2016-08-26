# Preview all emails at http://localhost:3000/rails/mailers/app_mailer
class AppMailerPreview < ActionMailer::Preview

  def send_forgot_password
    user = User.first
    AppMailer.send_forgot_password(user)

  end
end
