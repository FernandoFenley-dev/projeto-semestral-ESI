require 'spec_helper'

describe ApplicationMailer do
  describe 'recover_password_email' do
    cliente = Usuario.new
    cliente.email = "augusto.xavier@usp.br"
    cliente.id=1
    let(:user) {cliente}
    let(:mail) { ApplicationMailer.with(user: user).recover_password_email }
    it 'renders the subject' do
      expect(mail.subject).to eql('Recuperação de senha')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['noreply@company.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match('senha')
    end

    it 'assigns @confirmation_url' do
      expect(mail.body.encoded).to match("senha")
    end
  end
end
