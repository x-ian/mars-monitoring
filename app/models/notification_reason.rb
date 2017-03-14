class NotificationReason < ApplicationRecord
  has_many :notifications
  
  PROBE_OFFLINE = 1
  FORWARD = 2
  ALARM = 3
  
end
