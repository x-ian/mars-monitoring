class Message < ActiveRecord::Base
  has_many :events
  belongs_to :message_type
  belongs_to :probe
  attr_accessible :device_time, :device_uptime, :message_type_id, :outgoing_message_count, :probe_id, :restart_count, :value1, :value2, :value3, :value4, :server_time, :probe_enabled

  before_create :set_server_time_to_now
  before_create :set_probe_enabled
  
private
  def set_server_time_to_now
    self.server_time = Time.now
  end
  
  def set_probe_enabled
    self.probe_enabled = self.probe.enabled?
    true # if only this would have been obvious...
  end
  
end
