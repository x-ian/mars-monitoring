class ProbeIndicatorsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @probe = (params[:probe_id].blank? ? Probe.first : Probe.find(params[:probe_id]))    

    m = Message.where('probe_id = :probe_id ', probe_id: @probe.id).order('server_time ASC').limit(1).first
    @now = Time.now
    @today_or_first_contact = Time.now.beginning_of_day
    @today_or_first_contact = m.server_time if !m.nil? && @today_or_first_contact < m.server_time
    @yesterday_or_first_contact = (Time.now - 1.day).beginning_of_day
    @yesterday_or_first_contact = m.server_time if !m.nil? && @yesterday_or_first_contact < m.server_time
    @daysago7_or_first_contact = (Time.now - 7.day).beginning_of_day
    @daysago7_or_first_contact = m.server_time if !m.nil? && @daysago7_or_first_contact < m.server_time
    @daysago30_or_first_contact = (Time.now - 30.day).beginning_of_day 
    @daysago30_or_first_contact = m.server_time if !m.nil? && @daysago30_or_first_contact < m.server_time
    @first_contact = @today_or_first_contact - 5000.day
    @first_contact = m.server_time unless m.nil?
    
    # for today
    @stats_today = collect_overview(@probe.id, @today_or_first_contact, @now)
    # for @yesterday
    @stats_yesterday = collect_overview(@probe.id, @yesterday_or_first_contact, @today_or_first_contact)
    # for last 7 days
    @stats_daysago7 = collect_overview(@probe.id, @daysago7_or_first_contact, @today_or_first_contact)
    # for last 30 days
    @stats_daysago30 = collect_overview(@probe.id, @daysago30_or_first_contact, @today_or_first_contact)
    # from first contact
    @stats_ever = collect_overview(@probe.id, @first_contact, @now)

    respond_to do |format|
      format.html
    end
  end
  
  def collect_overview(probe_id, min_date, max_date)
    alarms = 0
    restarts = 0
    heartbeats = 0
    missing_messages = 0    
    
    value1_above_threshold = 0
    value1_below_threshold = 0
    value1_ratio = 0
    value1_accumulated = 0
    value1_average = 0
      
    messages = Message.where('probe_id = :probe_id AND server_time >= :min_date AND server_time < :max_date', probe_id: probe_id, min_date: min_date, max_date: max_date).order('server_time ASC')
    
    previous_outgoing_message_count = 0
    previous_outgoing_message_count = messages.first.outgoing_message_count unless messages.first.nil?

    minutes_offline = 0
    first_message = true
    heartbeat_interval = Probe.find(probe_id).probe_configuration.heartbeat_interval / 60
    previous_contact = min_date
    last_message = nil 
    
    messages.each do |m|
      
      # availability
      if !m.message_type.isAlarm?
        if m.server_time <= previous_contact + heartbeat_interval.minutes
          # first heartbeat is in time, looks ok at the beginning
        else
          # appears as if the first heartbeat didnt come in time, assuming downtime at the start
          # use the whole time above the missing intervall
          minutes_offline += (m.server_time - previous_contact - heartbeat_interval.minutes) / 60
          minutes_offline += heartbeat_interval/2
        end
        previous_contact = m.server_time
        last_message = m
      end
      
      # message stats
      alarms += 1 if m.message_type.isAlarm?
      restarts += 1 if m.message_type.isRestart?
      heartbeats += 1 if m.message_type.isHeartbeat?
      
      # service quality
      value1_above_threshold += 1 if m.value1_above_threshold?
      value1_below_threshold += 1 if m.value1_below_threshold?
      value1_accumulated += m.value1 unless m.value1.nil?
      
      # message stats
      if (m.outgoing_message_count > previous_outgoing_message_count + 1)
        missing_messages += (m.outgoing_message_count - previous_outgoing_message_count - 1)
      elsif (m.outgoing_message_count < previous_outgoing_message_count)
        if (m.outgoing_message_count == 1 && previous_outgoing_message_count == 255)
          # 8 bit message counter overflow from 255 to 0
        else
          # get missing messages from old counter up to 255
          missing_messages += (255 - previous_outgoing_message_count)
          # get missing messages from 0 up to current counter
          missing_messages += m.outgoing_message_count - 1
        end
      end
      previous_outgoing_message_count = m.outgoing_message_count
      
    end
    
    # service quality
    value1_ratio = ((1 - (value1_above_threshold.to_f / (value1_above_threshold + value1_below_threshold))) * 100) unless value1_below_threshold == 0
    value1_average = value1_accumulated.to_f / (alarms + restarts + heartbeats) unless (alarms + restarts + heartbeats) == 0
    
    # availability
    minutes_in_timeframe = (max_date.to_time.to_i - min_date.to_time.to_i) / 60
    if !last_message.nil? && last_message.server_time + heartbeat_interval.minutes < max_date
      # message missing before end of time frame
      minutes_offline += (max_date - last_message.server_time - heartbeat_interval.minutes) / 60
      minutes_offline += heartbeat_interval/2
      minutes_offline = minutes_offline.round
    end
    if last_message.nil?
      # no message at all, 100% downtime
      minutes_offline = minutes_in_timeframe
    end
    availability_ratio = ((1 - (minutes_offline.to_f / minutes_in_timeframe)) * 100).round
    
    # message stats
    expected_heartbeats = minutes_in_timeframe / (Probe.find(probe_id).probe_configuration.heartbeat_interval / 60)
    
    stats = { :alarms => alarms, :restarts => restarts, :heartbeats => heartbeats, :value1_above_threshold => value1_above_threshold, :value1_below_threshold => value1_below_threshold, :value1_ratio => value1_ratio.round, :value1_average => value1_average, :missing_messages => missing_messages, :minutes_in_timeframe => minutes_in_timeframe, :expected_heartbeats=> expected_heartbeats, :minutes_offline => minutes_offline, :availability_ratio => availability_ratio }
  end
  
end
