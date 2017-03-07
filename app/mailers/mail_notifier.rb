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

  def send_new_user_message(user)
    mail to: "cneumann@marsmonitoring.com", subject: "New user sign up: #{user.email}", :template_name => 'new_user_to_admin'
  end
  
  def probe_offline(probe, user, message)
    if probe.enabled?
      @probe = probe
      @user = user
      @message = message
      mail to: user.email, subject: "Probe offline for too long \'#{probe.name}\' located at \'#{probe.location.name}\'", :template_name => 'probe_offline'
    end
  end
  
end
