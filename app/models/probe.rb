class Probe < ApplicationRecord
  has_many :messages
  has_many :notifications
  belongs_to :probe_type
  belongs_to :customer
  belongs_to :location
  belongs_to :probe_configuration
  belongs_to :forward_subscription, :class_name => "Subscription"
  belongs_to :responsible_user, :class_name => "User"

  def status
    return "disabled" unless self.enabled?
    status = ""
        # todo, simplified by only looking for last message
        message = Message.where(probe_id: self.id).last
        if message.nil?
          status = "no contact"
        else
          if message.value1 == 1
            status = "ok"
          else
            status = "error"
          end
          if (message.server_time < DateTime.now-2.days)
            status += " (assumed)"
          end
        end
    status
  end

  def current_status
    return ProbeStatus::DISABLED unless self.enabled?
    # todo, simplified by only looking for last message
    m = Message.where(probe_id: self.id).last
    return ProbeStatus.find(ProbeStatus::NO_DATA) if m.nil?
    assumed = (m.server_time < DateTime.now-2.days)
    above_threshold = false
    
    above_threshold = above_threshold || (m.value1 >= m.probe.probe_configuration.value1_threshold) unless m.probe.probe_configuration.value1_threshold.nil? || m.value1.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value1_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value2 >= m.probe.probe_configuration.value2_threshold) unless m.probe.probe_configuration.value2_threshold.nil? || m.value2.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value2_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value3 >= m.probe.probe_configuration.value3_threshold) unless m.probe.probe_configuration.value3_threshold.nil? || m.value3.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value3_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value4 >= m.probe.probe_configuration.value4_threshold) unless m.probe.probe_configuration.value4_threshold.nil? || m.value4.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value4_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value5 >= m.probe.probe_configuration.value5_threshold) unless m.probe.probe_configuration.value5_threshold.nil? || m.value5.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value5_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value6 >= m.probe.probe_configuration.value6_threshold) unless m.probe.probe_configuration.value6_threshold.nil? || m.value6.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value6_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value7 >= m.probe.probe_configuration.value7_threshold) unless m.probe.probe_configuration.value7_threshold.nil? || m.value7.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value7_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value8 >= m.probe.probe_configuration.value8_threshold) unless m.probe.probe_configuration.value8_threshold.nil? || m.value8.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value8_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value9 >= m.probe.probe_configuration.value9_threshold) unless m.probe.probe_configuration.value9_threshold.nil? || m.value9.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value9_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value10 >= m.probe.probe_configuration.value10_threshold) unless m.probe.probe_configuration.value10_threshold.nil? || m.value10.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value10_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value11 >= m.probe.probe_configuration.value11_threshold) unless m.probe.probe_configuration.value11_threshold.nil? || m.value11.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value11_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value12 >= m.probe.probe_configuration.value12_threshold) unless m.probe.probe_configuration.value12_threshold.nil? || m.value12.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value12_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value13 >= m.probe.probe_configuration.value13_threshold) unless m.probe.probe_configuration.value13_threshold.nil? || m.value13.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value13_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value14 >= m.probe.probe_configuration.value14_threshold) unless m.probe.probe_configuration.value14_threshold.nil? || m.value14.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value14_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value15 >= m.probe.probe_configuration.value15_threshold) unless m.probe.probe_configuration.value15_threshold.nil? || m.value15.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value15_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value16 >= m.probe.probe_configuration.value16_threshold) unless m.probe.probe_configuration.value16_threshold.nil? || m.value16.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value16_type_id  == ValueType::NOT_CONFIGURED
    
    return ProbeStatus::OK if !assumed && !above_threshold
    return ProbeStatus::ERROR if !assumed && above_threshold
    return ProbeStatus::ASSUMED_OK if assumed && !above_threshold
    return ProbeStatus::ASSUMED_ERROR if assumed && above_threshold
  end
end
