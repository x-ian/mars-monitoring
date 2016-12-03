class Message < ActiveRecord::Base
  has_many :events
  belongs_to :message_type
  belongs_to :probe
  attr_accessible :device_time, :device_uptime, :message_type_id, :outgoing_message_count, :probe_id, :restart_count, :value1, :value2, :value3, :value4, :server_time, :probe_enabled, :archived

  before_create :set_server_time_to_now
  before_create :set_probe_enabled
  
  def value1_above_threshold?
    probe.probe_configuration.value1_threshold > value1
  end

  def value1_below_threshold?
    probe.probe_configuration.value1_threshold <= value1
  end
  
private
  def set_server_time_to_now
    self.server_time = Time.now if self.server_time.nil?
    true
  end
  
  def set_probe_enabled
    self.probe_enabled = self.probe.enabled?
    true # if only this would have been obvious...
  end
  
end
