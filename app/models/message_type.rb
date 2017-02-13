class MessageType < ActiveRecord::Base
  has_many :messages
  #attr_accessible :name
  
  ALARM = 1 #EventType.exists?(1) ? EventType.find(1).id : nil
  RESTART = 2 #EventType.exists?(1) ? EventType.find(1).id : nil
  HEARTBEAT = 3 #EventType.exists?(1) ? EventType.find(1).id : nil

  def isAlarm?
    id == ALARM
  end
  
  def isHeartbeat?
    id == HEARTBEAT
  end
  
  def isRestart?
    id == RESTART
  end
  
  def self.textFor(id)
    return "ALARM" if id == ALARM
    return "RESTART" if id == RESTART
    return "HEARTBEAT" if id == HEARTBEAT
    return "unknown"
  end
  
  def self.idFor(text)
    return ALARM if text.upcase == "ALARM"
    return ALARM if text.upcase == "PAYLOAD"
    return ALARM if text.upcase == "1"
    return RESTART if text.upcase == "RESTART"
    return RESTART if text.upcase == "2"
    return HEARTBEAT if text.upcase == "HEARTBEAT"
    return HEARTBEAT if text.upcase == "3"
    
    return -1
  end
end
