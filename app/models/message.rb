class Message < ActiveRecord::Base
  belongs_to :message_type
  belongs_to :probe
  attr_accessible :device_time, :device_uptime, :message_type_id, :outgoing_message_count, :probe_id, :restart_count, :server_time, :value1, :value2, :value3, :value4

  before_create :set_server_time_to_now
  
private
  def set_server_time_to_now
    self.server_time = Time.now
  end
end
