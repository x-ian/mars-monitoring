class Location < ActiveRecord::Base
  has_many :probes
  belongs_to :customer
  belongs_to :parent_location, :foreign_key => "parent_location_id", :class_name => "Location"

  def isLeaf?
    Location.where(parent_location_id: self).empty?
  end
end
