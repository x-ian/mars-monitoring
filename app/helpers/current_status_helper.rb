module CurrentStatusHelper
  def status(location, probe_type)
    probe = probe_type.probes.find_all{|p| p.location == location}.first
    if !probe.nil?
      return probe.status
    else
      return "-"
    end
  end

  def details_for_probe(location, probe_type)
    probe = probe_type.probes.find_all{|p| p.location == location}.first
    return "" if probe.nil?
    tooltip = ""
    tooltip += "Probe: <a href='../probes/#{probe.id}'>#{probe.name} (#{probe.id})</a><br/>"
    tooltip += "Data: <a href='../visualize_text/index?probe_id=#{probe.id}'>Textual</a>&nbsp;<a href='../visualize/d3_single_probe?probe_id=#{probe.id}'>Graphical</a><br/>"
    tooltip += "Last contact: "
    message = Message.find_last_by_probe_id(probe.id)
    if message.nil?
      tooltip += "never<br/>"
    else
      tooltip += "<a href='../messages/#{message.id}'>#{message.server_time}</a><br/>"
      tooltip += "Last values: #{message.value1} #{message.value2} #{message.value3} #{message.value4}<br/>"
      tooltip += "Restart count: #{message.restart_count}, Message count: #{message.outgoing_message_count}<br/>"
    end
    tooltip += "<br/>"
    tooltip.html_safe
  end
  
  def status_for_probes(location, probe_type)
    probes = probe_type.probes.find_all{|p| p.location == location}
    probe_status = nil
    probes.each do |p|
      probe_status = p.current_status.add(probe_status)
    end
    return probe_status
  end
    
end
