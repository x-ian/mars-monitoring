class Event < ActiveRecord::Base
  belongs_to :value_type
  belongs_to :probe_status
  belongs_to :message
  has_many :notifications
end
