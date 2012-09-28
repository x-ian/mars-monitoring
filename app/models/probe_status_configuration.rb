class ProbeStatusConfiguration < ActiveRecord::Base
  has_many :probes_probe_status_configrations
  attr_accessible :rule_assumed, :rule_error, :rule_ok, :rule_warning
end
