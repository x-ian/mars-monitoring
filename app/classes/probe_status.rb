class ProbeStatus
  
  UNKNOWN = -1
  NO_PROBE = 0
  NO_DATA = 1
  OK = 2
  WARNING = 3
  ERROR = 4
  
  def assumed?
    @assumed || false
  end
  
  def assumed=(v)
    @assumed = v
  end

  def status
    @status || ProbeStatus::NO_DATA
  end
  
  def status=(v)
    @status = v
  end
  
  def add(another_probe_status)
    @assumed = true if another_probe_status.assumed?
    if (status < another_probe_status.status)
      @status = another_probe_status.status 
    end
  end
  
  def to_text
    case status
      when ProbeStatus::NO_PROBE then return "(no probe)"
      when ProbeStatus::NO_DATA then return "no data"
      when ProbeStatus::OK then return "ok" + (assumed? ? " ???" : "")
      when ProbeStatus::WARNING then return "warning" + (assumed? ? " ???" : "")
      when ProbeStatus::ERROR then return "error" + (assumed? ? " ???" : "")
    end
    return "unknown status"
  end
  
end
