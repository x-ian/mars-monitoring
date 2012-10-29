class ProbeStatus < ActiveRecord::Base
  has_many :events
  attr_accessible :assumed, :name, :status, :severity_order
  
  DISABLED = ProbeStatus.find(9)
  OK = ProbeStatus.find(1)
  ASSUMED_OK = ProbeStatus.find(4)
  NO_DATA = ProbeStatus.find(7)
  UNKNOWN = ProbeStatus.find(8)
  ASSUMED_WARNING = ProbeStatus.find(5)
  WARNING = ProbeStatus.find(2)
  ASSUMED_ERROR = ProbeStatus.find(6)
  ERROR = ProbeStatus.find(3)
  
  def add(probe_status)
    return self if probe_status.nil?
    return probe_status if self.severity_order < probe_status.severity_order
    self
  end
end
