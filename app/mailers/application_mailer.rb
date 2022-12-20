class ApplicationMailer < ActionMailer::Base
  default from: "noreply@company.com"
  layout "mailer"

  def recover_password_email
    @user = params[:user]
    puts @user.email
    mail(to: @user.email, subject: 'Recuperação de senha', body: 'senha').deliver()
  end
end
