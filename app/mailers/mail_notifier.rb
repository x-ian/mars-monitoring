class MailNotifier < ActionMailer::Base
  default from: "notification@marsmonitoring.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_notifier.notify.subject
  #
  def notify
    @greeting = "Just a test"
    mail(to: "cneumann@marsmonitoring.com") #.deliver_later
  end

  def forward(message, user)
    @message = message
    @user = user
    mail to: user.email, subject: "#{MessageType.textFor(message.message_type.id)} message from \'#{message.probe.name}\' located at \'#{message.probe.location.name}\'", :template_name => 'forward'
  end
  
  def invalid_message(message, user)
    @message = message
    @user = user
    mail to: user.email, subject: "Invalid message arrived", :template_name => 'invalid_message'
  end

end
