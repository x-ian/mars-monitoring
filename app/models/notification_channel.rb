class NotificationChannel < ApplicationRecord
  has_many :notifications
  
  MAIL = 1
end
