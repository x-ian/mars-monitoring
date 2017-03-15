class ProcessNotificationsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    #Notification.where("processed IS NULL OR NOT(processed)").each do |n|
    Notification.where(processed: nil).or(Notification.where(processed: false)).each do |n|
      if n.notification_reason_id == NotificationReason::FORWARD
        begin
          m = n.message
          m.probe.forward_subscription.subscribers.each do |user|
            MailNotifier.forward(m, user).deliver_now
            n.sent_at = Time.now
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
          # alarm only when previous message was below threshold; so alarm only send out once
          m = n.message              
          m.probe.forward_subscription.subscribers.each do |user|
            #logger.debug "forward msg id #{m.id} to #{user.name}"
            MailNotifier.alarm(m, user).deliver_now
            n.sent_at = Time.now
          end
        rescue => e
          logger.warn "Problem forwarding notification: #{e}"
          n.error = e
          #n.processed = true
        end
        n.processed = true
        n.save
      end

      if n.notification_reason_id == NotificationReason::RESTART
        begin
          # alarm only when previous message was below threshold; so alarm only send out once
          m = n.message              
          m.probe.forward_subscription.subscribers.each do |user|
            #logger.debug "forward msg id #{m.id} to #{user.name}"
            MailNotifier.restart(m, user).deliver_now
            n.sent_at = Time.now
          end
        rescue => e
          logger.warn "Problem forwarding notification: #{e}"
          n.error = e
          #n.processed = true
        end
        n.processed = true
        n.save
      end

    end    
  end
  
end
