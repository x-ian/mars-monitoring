class CheckForOfflineProbesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Probe.all.each do |p| #where('id = :enabled2', enabled2: 1).each do |p|
      unless(p.probe_configuration.heartbeat_interval.nil?)
        probe_offline(p)
      end
    end
      
  end
  
  def probe_offline(probe)
#    logger.debug(probe)
    heartbeats_before_warning = 10
    m = Message.where('probe_id = :probe_id', probe_id: probe.id).order('server_time DESC').limit(1).last
    unless (m.nil?)
      assumed_offline_from = (m.server_time + (probe.probe_configuration.heartbeat_interval * heartbeats_before_warning).seconds)
      logger.debug m.server_time
      logger.debug probe.probe_configuration.heartbeat_interval
      logger.debug assumed_offline_from
      logger.debug Time.now
      if (Time.now > assumed_offline_from)
        # last contact too long ago
        # send message
        notify_users(probe, m)
        logger.debug("ALARM")
      end
  end
  end
  
  def notify_users(probe, message)
    begin
      probe.forward_subscription.subscribers.each do |user|
        #logger.debug "forward msg id #{m.id} to #{user.name}"
        MailNotifier.probe_offline(probe, user, message).deliver_now
      end
    rescue => e
      logger.warn "Problem notifying users: #{e}"
    end
  end
  
end
