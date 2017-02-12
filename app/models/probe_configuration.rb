class ProbeConfiguration < ActiveRecord::Base
  has_many :probes
  
  attr_accessible :alarm_interval, :name, :heartbeat_interval, :rule_assumed, :rule_error, :rule_ok, :rule_warning, :value1_threshold, :value2_threshold, :value3_threshold, :value4_threshold, :value5_threshold, :value6_threshold, :value7_threshold, :value8_threshold, :value9_threshold, :value10_threshold, :value11_threshold, :value12_threshold, :value13_threshold, :value14_threshold, :value15_threshold, :value16_threshold
end
