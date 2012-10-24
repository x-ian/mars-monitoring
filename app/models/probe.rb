class Probe < ActiveRecord::Base
  has_many :messages
  belongs_to :probe_type
  belongs_to :customer
  belongs_to :location
  belongs_to :probe_configuration
  attr_accessible :name, :location_coordinates, :enabled, :customer_id, :location_id, :probe_type_id, :cell_number, :probe_configuration_id

  def status
    return "disabled" unless self.enabled?
    status = ""
        # todo, simplified by only looking for last message
        message = Message.find_last_by_probe_id(self.id)
        if message.nil?
          status = "no contact"
        else
          if message.value1 == 1
            status = "ok"
          else
            status = "error"
          end
          if (message.server_time < DateTime.now-2.days)
            status += " (assumed)"
          end
        end
    status
  end
  
end
