class MailNotifier < ActionMailer::Base
  default from: "notification@marsmonitoring.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_notifier.notify.subject
  #
  def notify
    @greeting = "Hi"

    mail to: "christian.neumann@gmx.de"
  end

  def forward(message, user)
    @message = message
    @user = user
    mail to: "christian.neumann@gmx.de"
  end

end
