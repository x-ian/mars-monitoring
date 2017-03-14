class ProcessNotificationsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Notification.where("processed IS NULL || NOT(processed)").each do |n|
      if n.notification_reason_id == NotificationReason::FORWARD
        begin
          m = n.message
          if !m.probe.forward_subscription.nil? &&
            ((m.probe.forward_subscription.include_alarm && m.message_type.isAlarm?) ||
            (m.probe.forward_subscription.include_restart && m.message_type.isRestart?) ||
            (m.probe.forward_subscription.include_heartbeat && m.message_type.isHeartbeat?))
            m.probe.forward_subscription.subscribers.each do |user|
              MailNotifier.forward(m, user).deliver_now
              n.sent_at = Time.now
            end
          end
        rescue => e
          logger.warn "Problem forwarding notification: #{e}"
          n.error = e
        end
        n.processed = true
        n.save
      end

      if n.notification_reason_id == NotificationReason::ALARM
        begin
          m = n.message
          if value_above_threshold(m.value1, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value2, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value3, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value4, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value5, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value6, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value7, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value8, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value9, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value10, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value11, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value12, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value13, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value14, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value15, m.probe.probe_configuration.value1_threshold) ||
            value_above_threshold(m.value16, m.probe.probe_configuration.value1_threshold)
            if !m.probe.forward_subscription.nil? &&
              (m.probe.forward_subscription.generate_alarm_from_heartbeat && m.message_type.isHeartbeat?)
              m.probe.forward_subscription.subscribers.each do |user|
                #logger.debug "forward msg id #{m.id} to #{user.name}"
                MailNotifier.alarm(m, user).deliver_now
                n.sent_at = Time.now
              end
            end
          end
        rescue => e
          logger.warn "Problem forwarding notification: #{e}"
          logger.warn e.backtrace
          n.error = e
          #n.processed = true
        end
        n.processed = true
        n.save
      end

    end    
  end
  
  def value_above_threshold(value, value_threshold)
    return !value_threshold.nil? && !value.nil? && value, value_threshold 
  end
  
end
