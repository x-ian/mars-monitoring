# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
MessageType.delete_all
MessageType.create! do |mt|
  mt.id = 1
  mt.name = "payload"
end
MessageType.create! do |mt|
  mt.id = 2
  mt.name = "restart"
end
MessageType.create! do |mt|
  mt.id = 3
  mt.name = "heartbeat"
end

ServiceClassification.delete_all
ServiceClassification.create! do |sc|
  sc.id = 1
  sc.name = 'Internet'
  sc.parent_service_classification_id = nil
end
ServiceClassification.create! do |sc|
  sc.id = 2
  sc.name = 'Water'
  sc.parent_service_classification_id = nil
end
ServiceClassification.create! do |sc|
  sc.id = 3
  sc.name = 'Power'
  sc.parent_service_classification_id = nil
end
ServiceClassification.create! do |sc|
  sc.id = 4
  sc.name = 'Climate'
  sc.parent_service_classification_id = nil
end
ServiceClassification.create! do |sc|
  sc.id = 5
  sc.name = 'Voltage'
  sc.parent_service_classification_id = 3
end
ServiceClassification.create! do |sc|
  sc.id = 6
  sc.name = 'Temperature'
  sc.parent_service_classification_id = 4
end
ServiceClassification.create! do |sc|
  sc.id = 7
  sc.name = 'Availability'
  sc.parent_service_classification_id =  3
end

# test data, remove at one point
Customer.delete_all
Customer.create! do |c|
  c.id = 1
  c.name = 'mars-monitoring'
end
Customer.create! do |c|
  c.id = 2
  c.name = 'APZU'
end

Location.delete_all
Location.create! do |l|
  l.id = 1
  l.name = 'Neno District'
  l.parent_location_id = nil
end
Location.create! do |l|
  l.id = 2
  l.name = 'Neno Boma'
  l.parent_location_id = 1
end
Location.create! do |l|
  l.id = 3
  l.name = 'Lisungwi'
  l.parent_location_id = 1
end
Location.create! do |l|
  l.id = 4
  l.name = 'Matope'
  l.parent_location_id = 1
end
Location.create! do |l|
  l.id = 5
  l.name = 'Germany'
  l.parent_location_id = nil
end
Location.create! do |l|
  l.id = 6
  l.name = 'Mainz'
  l.parent_location_id = 5
end

Probe.delete_all
Probe.create! do |p|
  p.id = 1
  p.name = 'Internet access'
  p.customer_id = 1
  p.location_id = 2
  p.location_coordinates = nil
  p.service_classification_id = 1
  p.enabled = true
end
Probe.create! do |p|
  p.id = 2
  p.name = 'Dalitso Water tank'
  p.customer_id = 1
  p.location_id = 2
  p.location_coordinates = nil
  p.service_classification_id = 2
  p.enabled = true
end
Probe.create! do |p|
  p.id = 3
  p.name = 'Internet access'
  p.customer_id = 1
  p.location_id = 6
  p.location_coordinates = nil
  p.service_classification_id = 1
  p.enabled = true
end
Probe.create! do |p|
  p.id = 4
  p.name = 'Backup batteries server room'
  p.customer_id = 1
  p.location_id = 2
  p.location_coordinates = nil
  p.service_classification_id = 5
  p.enabled = true
end
Probe.create! do |p|
  p.id = 5
  p.name = 'Temperature lab'
  p.customer_id = 1
  p.location_id = 2
  p.location_coordinates = nil
  p.service_classification_id = 6
  p.enabled = true
end
Probe.create! do |p|
  p.id = 6
  p.name = 'Water'
  p.customer_id = 1
  p.location_id = 4
  p.location_coordinates = nil
  p.service_classification_id = 2
  p.enabled = true
end
