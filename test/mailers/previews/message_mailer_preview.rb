# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/become_coach
  def become_coach
  	message = Message.new fname: 'Jean',
  						  phone: '0604567834',
  						  email: 'jean.dupond@mail.com',
  						  body: 'Je souhaiterais devenir coach'
    MessageMailer.become_coach message
  end

end
