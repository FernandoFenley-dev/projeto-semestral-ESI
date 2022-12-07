class ApplicationMailer < ActionMailer::Base
  default from: "from@gmail.com"
  layout "mailer"

  def recover_password_email
    puts 'AAAAArecoverrr'

    @user = params[:user]
    puts @user.email

    mail(to: @user.email, subject: 'Recuperação de senha', body: 'something').deliver()
  end
end
