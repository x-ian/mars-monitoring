class MessageType < ActiveRecord::Base
  has_many :messages
  attr_accessible :name
  
  PAYLOAD = 1 #EventType.exists?(1) ? EventType.find(1).id : nil
  RESTART = 2 #EventType.exists?(1) ? EventType.find(1).id : nil
  HEARTBEAT = 3 #EventType.exists?(1) ? EventType.find(1).id : nil
  
end
