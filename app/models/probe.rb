class Probe < ActiveRecord::Base
  has_many :messages
  belongs_to :probe_type
  belongs_to :customer
  belongs_to :location
  belongs_to :probe_configuration
  belongs_to :forward_subscription, :class_name => "Subscription"
  belongs_to :responsible_user, :class_name => "User"
  attr_accessible :name, :location_coordinates, :enabled, :customer_id, :location_id, :probe_type_id, :cell_number, :probe_configuration_id, :forward_subscription_id, :responsible_user_id

  def status
    return "disabled" unless self.enabled?
    status = ""
        # todo, simplified by only looking for last message
        message = Message.find_last_by_probe_id(self.id)
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
    m = Message.find_last_by_probe_id(self.id)
    return ProbeStatus.find(ProbeStatus::NO_DATA) if m.nil?
    assumed = (m.server_time < DateTime.now-2.days)
    above_threshold = false
    
    above_threshold = above_threshold || (m.value1 >= m.probe.probe_configuration.value1_threshold) unless m.probe.probe_configuration.value1_threshold.nil? || m.value1.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value1_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value2 >= m.probe.probe_configuration.value2_threshold) unless m.probe.probe_configuration.value2_threshold.nil? || m.value2.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value2_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value3 >= m.probe.probe_configuration.value3_threshold) unless m.probe.probe_configuration.value3_threshold.nil? || m.value3.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value3_type_id  == ValueType::NOT_CONFIGURED
    
    above_threshold = above_threshold || (m.value4 >= m.probe.probe_configuration.value4_threshold) unless m.probe.probe_configuration.value4_threshold.nil? || m.value4.nil? ||  m.probe.probe_type.nil? || m.probe.probe_type.value4_type_id  == ValueType::NOT_CONFIGURED
    
    return ProbeStatus::OK if !assumed && !above_threshold
    return ProbeStatus::ERROR if !assumed && above_threshold
    return ProbeStatus::ASSUMED_OK if assumed && !above_threshold
    return ProbeStatus::ASSUMED_ERROR if assumed && above_threshold
  end
end
