class MailNotifier < ActionMailer::Base
  default from: "notification@marsmonitoring.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_notifier.notify.subject
  #
  def notify
    @greeting = "Just a test"
    mail to: "cneumann@marsmonitoring.com"
  end

  def forward_to_all(message)
    message.probe.forward_subscription.subscribers.each do |user|
      forward(message, user).deliver
    end
  end
  
  def forward(message, user)
    @message = message
    @user = user
    mail to: user.email, subject: "#{MessageType.textFor(message.message_type.id)} message from \'#{message.probe.name}\' located at \'#{message.probe.location.name}\'", :template_name => 'forward'
  end

end
