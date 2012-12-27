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

  def forward(message)
    @message = message
    message.probe.forward_subscription.subscribers.each do |user|
      @user = user
      mail to: user.email, subject: "SMS forward from \'#{message.probe.name}\' located at \'#{message.probe.location.name}\'"
    end
  end

end
