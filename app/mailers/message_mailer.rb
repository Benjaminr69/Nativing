class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.become_coach.subject
  #
  def become_coach(message)
    @greeting = "Bonjour"
    @fname = message.fname
    @phone = message.phone
    @body = message.body

    mail to: "admin@nativing.com", from: message.email
  end
end
