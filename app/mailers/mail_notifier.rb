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
    begin
      if (message.probe.forward_subcription.include_alarm && message.message_type.isAlarm?) ||
        (message.probe.forward_subcription.include_restart && message.message_type.isRestart?) ||
        (message.probe.forward_subcription.include_heartbeat && message.message_type.isHeartbeat?)
        message.probe.forward_subscription.subscribers.each do |user|
          forward(message, user).deliver
        end
      end
    rescue => e
      logger.warn "Problem forwarding notification: #{e}"
    end
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
