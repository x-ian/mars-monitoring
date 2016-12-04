class ProbeIndicatorsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @probe = (params[:probe_id].blank? ? Probe.find(1) : Probe.find(params[:probe_id]))    

    @today = Date.today
    @tomorrow = @today + 1.day
    @yesterday = @today - 1.day
    @daysago7 = @today - 7.days
    @daysago30 = @today - 30.day
    @ever = @today - 5000.day
    
    # for today
    @stats_today = collect_overview(@probe.id, @today, @tomorrow)
    # for @yesterday
    @stats_yesterday = collect_overview(@probe.id, @yesterday, @today)
    # for last 7 days
    @stats_daysago7 = collect_overview(@probe.id, @daysago7, @today)
    # for last 30 days
    @stats_daysago30 = collect_overview(@probe.id, @daysago30, @today)
    # for @ever
    @stats_ever = collect_overview(@probe.id, @ever, @tomorrow)

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
    
    messages.each do |m|
    
      alarms = alarms+1 if m.message_type.isAlarm?
      restarts = restarts+1 if m.message_type.isRestart?
      heartbeats = heartbeats+1 if m.message_type.isHeartbeat?
      
      value1_above_threshold = value1_above_threshold+1 if m.value1_above_threshold?
      value1_below_threshold = value1_below_threshold+1 if m.value1_below_threshold?
      value1_accumulated += m.value1 unless m.value1.nil?
      
      if (m.outgoing_message_count > previous_outgoing_message_count + 1)
        missing_messages = missing_messages + (m.outgoing_message_count - previous_outgoing_message_count - 1)
      elsif (m.outgoing_message_count < previous_outgoing_message_count)
        if (m.outgoing_message_count == 1 && previous_outgoing_message_count == 255)
          # 8 bit message counter overflow from 255 to 0
        else
          # get missing messages from old counter up to 255
          missing_messages = missing_messages + (255 - previous_outgoing_message_count)
          # get missing messages from 0 up to current counter
          missing_messages = missing_messages + m.outgoing_message_count - 1
        end
      end
      previous_outgoing_message_count = m.outgoing_message_count
      
    end

    value1_ratio = ((1 - (value1_above_threshold.to_f / (value1_above_threshold + value1_below_threshold))) * 100) unless value1_below_threshold == 0
    value1_average = value1_accumulated.to_f / (alarms + restarts + heartbeats) unless (alarms + restarts + heartbeats) == 0
    
    minutes_in_timeframe = (max_date.to_time.to_i - min_date.to_time.to_i) / 60
    
    expected_heartbeats = minutes_in_timeframe / (Probe.find(probe_id).probe_configuration.heartbeat_interval / 60)
    stats = { :alarms => alarms, :restarts => restarts, :heartbeats => heartbeats, :value1_above_threshold => value1_above_threshold, :value1_below_threshold => value1_below_threshold, :value1_ratio => value1_ratio, :value1_average => value1_average, :missing_messages => missing_messages, :minutes_in_timeframe => minutes_in_timeframe, :expected_heartbeats=> expected_heartbeats }
  end
  
end
