module DashboardHelper
  def status(location, serviceClassification)
    probes = Probe.find_all_by_location_id_and_service_classification_id_and_enabled(location, serviceClassification, true)
    ps = ProbeStatus.new
    if probes.empty?
      ps.status = ProbeStatus::NO_PROBE
    else
      probes.each do |probe|
        ps.add(status_of_probe(probe))
      end
    end
    ps
  end

  def status_of_probe(probe)
    ps = ProbeStatus.new
    case probe.id
    when 1
        # mainz network monitor
        # todo, simplified by only looking for last message
        message = Message.find_last_by_probe_id_and_message_type_id(probe.id, MessageType::PAYLOAD)
        if message.nil?
          ps.status = ProbeStatus::NO_PROBE
        else
          if message.value1 == 1
            ps.status = ProbeStatus::OK 
          else
            ps.status = ProbeStatus::ERROR
          end
          if (message.server_time < DateTime.now-2.days)
            ps.assumed = true
          end
        end
    end
    ps
  end
  
  def details_for_probes(location, serviceClassification)
    probes = Probe.find_all_by_location_id_and_service_classification_id_and_enabled(location, serviceClassification, true)
    tooltip = ""
    probes.each do |probe|
      tooltip += "Probe: <a href='../probes/#{probe.id}'>#{probe.name} (#{probe.id})</a><br/>"
      tooltip += "Last contact: "
      message = Message.find_last_by_probe_id_and_message_type_id(probe.id, MessageType::PAYLOAD)
      if message.nil?
        tooltip += "never<br/>"
      else
        tooltip += "<a href='../messages/#{message.id}'>#{message.server_time}</a><br/>"
        tooltip += "Last values: #{message.value1} #{message.value2} #{message.value3} #{message.value4}<br/>"
        tooltip += "Uptime: #{message.device_uptime}, Restart count: #{message.restart_count}, Message count: #{message.outgoing_message_count}<br/>"
      end
      tooltip += "<br/>"
    end
    tooltip.html_safe
  end
end
