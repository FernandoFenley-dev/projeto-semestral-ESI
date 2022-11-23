class ApplicationMailer < ActionMailer::Base
  default from: "juan.kineipe@gmail.com"
  layout "mailer"

  def recover_password_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Recuperação de senha')
  end
end
