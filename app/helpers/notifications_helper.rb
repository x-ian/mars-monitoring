module NotificationsHelper
  def create_notifications(m)
    text = "#{text} #{create_notification_text("value", m.value1, m.probe_configuration.value1_threshold)}"
  end
  
  def create_notifications_text(value_text, value, value_threshold)
    if !value_threshold.nil? && !value.nil? && value >= value_threshold 
      return "#{value_text} above threshold #{value} >= #{value_threshold}\n<br/>"
    end
    ""
  end

end
