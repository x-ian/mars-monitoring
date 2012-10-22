class ProbeConfiguration < ActiveRecord::Base
  has_many :probes
  
  attr_accessible :alarm_interval, :name, :heartbeat_interval, :rule_assumed, :rule_error, :rule_ok, :rule_warning, :value1_threshold, :value2_threshold, :value3_threshold, :value4_threshold
end
