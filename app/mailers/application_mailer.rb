class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  def recover_password_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Recuperação de senha')
  end
end
