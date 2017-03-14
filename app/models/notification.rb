class Notification < ApplicationRecord
  belongs_to :notification_reason
  belongs_to :probe
  belongs_to :message
  belongs_to :invalid_message
  belongs_to :event
  belongs_to :notification_channel
end
