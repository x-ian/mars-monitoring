class Message < ApplicationRecord
  has_many :events
  belongs_to :message_type
  belongs_to :probe
  has_many :notifications

  before_create :set_server_time_to_now
  before_create :set_probe_enabled

  def above_threshold?(value, value_threshold)
    if value.nil? || value_threshold.nil?
      false
    else
      value_threshold < value
    end
  end
    
  def below_threshold?(value, value_threshold)
    if value.nil? || value_threshold.nil?
      true
    else
      value_threshold >= value
    end
  end
  
  def value1_above_threshold?
    above_threshold?(value1, probe.probe_configuration.value1_threshold)
  end

  def value1_below_threshold?
    below_threshold?(value1, probe.probe_configuration.value1_threshold)
  end
  
  def value2_above_threshold?
    above_threshold?(value2, probe.probe_configuration.value2_threshold)
  end

  def value2_below_threshold?
    below_threshold?(value2, probe.probe_configuration.value2_threshold)
  end
  
  def value3_above_threshold?
    above_threshold?(value3, probe.probe_configuration.value3_threshold)
  end

  def value3_below_threshold?
    below_threshold?(value3, probe.probe_configuration.value3_threshold)
  end
  
  def value4_above_threshold?
    above_threshold?(value4, probe.probe_configuration.value4_threshold)
  end

  def value4_below_threshold?
    below_threshold?(value4, probe.probe_configuration.value4_threshold)
  end
  
  def value5_above_threshold?
    above_threshold?(value5, probe.probe_configuration.value5_threshold)
  end

  def value5_below_threshold?
    below_threshold?(value5, probe.probe_configuration.value5_threshold)
  end
  
  def value6_above_threshold?
    above_threshold?(value6, probe.probe_configuration.value6_threshold)
  end

  def value6_below_threshold?
    below_threshold?(value6, probe.probe_configuration.value6_threshold)
  end
  
  def value7_above_threshold?
    above_threshold?(value7, probe.probe_configuration.value7_threshold)
  end

  def value7_below_threshold?
    below_threshold?(value7, probe.probe_configuration.value7_threshold)
  end
  
  def value8_above_threshold?
    above_threshold?(value8, probe.probe_configuration.value8_threshold)
  end

  def value8_below_threshold?
    below_threshold?(value8, probe.probe_configuration.value8_threshold)
  end
  
  def value9_above_threshold?
    above_threshold?(value9, probe.probe_configuration.value9_threshold)
  end

  def value9_below_threshold?
    below_threshold?(value9, probe.probe_configuration.value9_threshold)
  end
  
  def value10_above_threshold?
    above_threshold?(value10, probe.probe_configuration.value10_threshold)
  end

  def value10_below_threshold?
    below_threshold?(value10, probe.probe_configuration.value10_threshold)
  end
  
  def value11_above_threshold?
    above_threshold?(value11, probe.probe_configuration.value11_threshold)
  end

  def value11_below_threshold?
    below_threshold?(value11, probe.probe_configuration.value11_threshold)
  end
  
  def value12_above_threshold?
    above_threshold?(value12, probe.probe_configuration.value12_threshold)
  end

  def value12_below_threshold?
    below_threshold?(value12, probe.probe_configuration.value12_threshold)
  end
  
  def value13_above_threshold?
    above_threshold?(value13, probe.probe_configuration.value13_threshold)
  end

  def value13_below_threshold?
    below_threshold?(value13, probe.probe_configuration.value13_threshold)
  end
  
  def value14_above_threshold?
    above_threshold?(value14, probe.probe_configuration.value14_threshold)
  end

  def value14_below_threshold?
    below_threshold?(value14, probe.probe_configuration.value14_threshold)
  end
  
  def value15_above_threshold?
    above_threshold?(value15, probe.probe_configuration.value15_threshold)
  end

  def value15_below_threshold?
    below_threshold?(value15, probe.probe_configuration.value15_threshold)
  end
  
  def value16_above_threshold?
    above_threshold?(value16, probe.probe_configuration.value16_threshold)
  end

  def value16_below_threshold?
    below_threshold?(value16, probe.probe_configuration.value16_threshold)
  end
  
private
  def set_server_time_to_now
    self.server_time = Time.now if self.server_time.nil?
    true
  end
  
  def set_probe_enabled
    self.probe_enabled = self.probe.enabled unless self.probe.nil?
    true # if only this would have been obvious...
  end
  
end
