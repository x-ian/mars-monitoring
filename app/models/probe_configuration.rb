class ProbeConfiguration < ActiveRecord::Base
  has_many :probes
  
  attr_accessible :alarm_interval, :name, :heartbeat_interval, :rule_assumed, :rule_error, :rule_ok, :rule_warning, :value1_threshold, :value2_threshold, :value3_threshold, :value4_threshold, :value5_threshold, :value6_threshold, :value7_threshold, :value8_threshold, :value9_threshold, :value10_threshold, :value11_threshold, :value12_threshold, :value13_threshold, :value14_threshold, :value15_threshold, :value16_threshold
  
  def generate_alarm_from_heartbeat(heartbeat_message)
    message = Message.new
    message.message_type_id = MessageType.idFor(tokens[0])
    #   m.customer_id = tokens[1]
    message.probe_id = heartbeat_message.probe_id
    message.device_time = message.device_time
    # m.device_uptime(tokens[])
    message.outgoing_message_count = tokens[3]
    @message.restart_count = tokens[4]
    @message.value1 = tokens[7]
    @message.value2 = tokens[8]
    @message.value3 = tokens[9]
    @message.value4 = tokens[10]
    if data.count(",") == 21
      @message.value5 = tokens[11]
      @message.value6 = tokens[12]
      @message.value7 = tokens[13]
      @message.value8 = tokens[14]
      @message.value9 = tokens[15]
      @message.value10 = tokens[16]
      @message.value11 = tokens[17]
      @message.value12 = tokens[18]
      @message.value13 = tokens[19]
      @message.value14 = tokens[20]
      @message.value15 = tokens[21]
      @message.value16 = tokens[22]
    end
    @message.server_time = DateTime.strptime(tokens[6], '%Y%m%d-%H%M%S')
    @message.archived = false
    saved = @message.save
    
  end
end
