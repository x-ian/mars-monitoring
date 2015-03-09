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
  mt.name = "alarm"
end
MessageType.create! do |mt|
  mt.id = 2
  mt.name = "restart"
end
MessageType.create! do |mt|
  mt.id = 3
  mt.name = "heartbeat"
end

ProbeStatus.delete_all
ProbeStatus.create! do |ps|
  ps.id = 1
  ps.name = "ok"
  ps.status = "ok"
  ps.assumed = false
  ps.severity_order = 2
end
ProbeStatus.create! do |ps|
  ps.id = 2
  ps.name = "warning"
  ps.status = "warning"
  ps.assumed = false
  ps.severity_order = 7
end
ProbeStatus.create! do |ps|
  ps.id = 3
  ps.name = "error"
  ps.status = "error"
  ps.assumed = false
  ps.severity_order = 9
end
ProbeStatus.create! do |ps|
  ps.id = 4
  ps.name = "assumed ok"
  ps.status = "ok"
  ps.assumed = true
  ps.severity_order = 3
end
ProbeStatus.create! do |ps|
  ps.id = 5
  ps.name = "assumed warning"
  ps.status = "warning"
  ps.assumed = true
  ps.severity_order = 6
end
ProbeStatus.create! do |ps|
  ps.id = 6
  ps.name = "assumed error"
  ps.status = "error"
  ps.assumed = true
  ps.severity_order = 8
end
ProbeStatus.create! do |ps|
  ps.id = 7
  ps.name = "no data"
  ps.status = "no data"
  ps.severity_order = 4
end
ProbeStatus.create! do |ps|
  ps.id = 8
  ps.name = "unknown"
  ps.status = "unknown"
  ps.severity_order = 5
end
ProbeStatus.create! do |ps|
  ps.id = 9
  ps.name = "disabled"
  ps.status = "disabled"
  ps.severity_order = 1
end

ValueType.delete_all
ValueType.create! do |sc|
  sc.id = 1
  sc.name = '-'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 2
  sc.name = 'unknown'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 3
  sc.name = 'Ping time'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 4
  sc.name = 'HTTP get time'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 5
  sc.name = 'Celsius'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 6
  sc.name = 'on/off'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 7
  sc.name = 'Volts'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 8
  sc.name = 'Encounters created'
  sc.cumulative = true
end
ValueType.create! do |sc|
  sc.id = 9
  sc.name = 'Scale working'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 10
  sc.name = 'Drug stockout'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 11
  sc.name = '# goats in clinic'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 12
  sc.name = '# patient visits'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 13
  sc.name = 'Tank half empty'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 14
  sc.name = 'Litres'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 15
  sc.name = 'HTTP throughput'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 16
  sc.name = 'Humidity'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 17
  sc.name = 'Pending messages'
  sc.cumulative = false
end
ValueType.create! do |sc|
  sc.id = 18
  sc.name = '# incoming messages'
  sc.cumulative = false
end

CommunicationChannel.delete_all
CommunicationChannel.create! do |p|
  p.id = 1
  p.name = "GSM"
end
CommunicationChannel.create! do |p|
  p.id = 2
  p.name = "Ethernet"
end
CommunicationChannel.create! do |p|
  p.id = 3
  p.name = "WiFi"
end
CommunicationChannel.create! do |p|
  p.id = 4
  p.name = "GPRS"
end

ProbeType.delete_all
ProbeType.create! do |pt|
  pt.id = 1
  pt.name = "Internet access"
  pt.description = ""
  pt.communication_channel_id = 2
  pt.value1_type_id = 3
  pt.value2_type_id = 4
  pt.value3_type_id = 1
  pt.value4_type_id = 1
end
ProbeType.create! do |pt|
  pt.id = 2
  pt.name = "Temperature"
  pt.description = ""
  pt.communication_channel_id = 1
  pt.value1_type_id = 5
  pt.value2_type_id = 1
  pt.value3_type_id = 1
  pt.value4_type_id = 1
end
ProbeType.create! do |pt|
  pt.id = 3
  pt.name = "Water level"
  pt.description = ""
  pt.communication_channel_id = 1
  pt.value1_type_id = 2
  pt.value2_type_id = 1
  pt.value3_type_id = 1
  pt.value4_type_id = 1
end
ProbeType.create! do |pt|
  pt.id = 4
  pt.name = "AC power availability"
  pt.description = ""
  pt.communication_channel_id = 2
  pt.value1_type_id = 6
  pt.value2_type_id = 1
  pt.value3_type_id = 1
  pt.value4_type_id = 1
end
ProbeType.create! do |pt|
  pt.id = 5
  pt.name = "DC Voltage"
  pt.description = ""
  pt.communication_channel_id = 2
  pt.value1_type_id = 7
  pt.value2_type_id = 7
  pt.value3_type_id = 7
  pt.value4_type_id = 7
end
ProbeType.create! do |pt|
  pt.id = 6
  pt.name = "OpenMRS status"
  pt.description = ""
  pt.communication_channel_id = 3
  pt.value1_type_id = 6
  pt.value2_type_id = 8
  pt.value3_type_id = 1
  pt.value4_type_id = 1
end
ProbeType.create! do |pt|
  pt.id = 7
  pt.name = "Mobile phone HC survey"
  pt.description = ""
  pt.communication_channel_id = 1
  pt.value1_type_id = 9
  pt.value2_type_id = 10
  pt.value3_type_id = 11
  pt.value4_type_id = 12
end
ProbeType.create! do |pt|
  pt.id = 8
  pt.name = "Guard checkin"
  pt.description = "Simple push button system to monitor availability of guards."
  pt.communication_channel_id = 1
  pt.value1_type_id = 13
  pt.value2_type_id = 1
  pt.value3_type_id = 1
  pt.value4_type_id = 1
end
ProbeType.create! do |pt|
  pt.id = 9
  pt.name = "GSM Ethernet Gateway"
  pt.description = ""
  pt.communication_channel_id = 1
  pt.value1_type_id = 18
  pt.value2_type_id = 17
  pt.value3_type_id = 1
  pt.value4_type_id = 1
end
ProbeType.create! do |pt|
  pt.id = 10
  pt.name = "Internet speed"
  pt.description = ""
  pt.communication_channel_id = 1
  pt.value1_type_id = 18
  pt.value2_type_id = 17
  pt.value3_type_id = 1
  pt.value4_type_id = 1
end
ProbeType.create! do |pt|
  pt.id = 11
  pt.name = "DC power availability"
  pt.description = ""
  pt.communication_channel_id = 4
  pt.value1_type_id = 6
  pt.value2_type_id = 1
  pt.value3_type_id = 1
  pt.value4_type_id = 1
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
Customer.create! do |c|
  c.id = 3
  c.name = 'Douglas Enterprises'
end

Location.delete_all
Location.create! do |l|
  l.id = 1
  l.name = 'Germany'
  l.customer_id = 1
  l.parent_location_id = nil
end
Location.create! do |l|
  l.id = 2
  l.name = 'Nierstein'
  l.customer_id = 1
  l.parent_location_id = 1
end
Location.create! do |l|
  l.id = 3
  l.name = 'Neno District'
  l.customer_id = 2
  l.parent_location_id = nil
end
Location.create! do |l|
  l.id = 4
  l.name = 'Neno Boma'
  l.customer_id = 2
  l.parent_location_id = 3
end
Location.create! do |l|
  l.id = 5
  l.name = 'Lisungwi'
  l.customer_id = 2
  l.parent_location_id = 3
end
Location.create! do |l|
  l.id = 6
  l.name = 'Matope'
  l.customer_id = 2
  l.parent_location_id = 3
end
Location.create! do |l|
  l.id = 7
  l.name = 'Lilongwe'
  l.customer_id = 3
  l.parent_location_id = nil
end
Location.create! do |l|
  l.id = 8
  l.name = 'Somewhere else'
  l.customer_id = 3
  l.parent_location_id = nil
end

Probe.delete_all
Probe.create! do |p|
  p.id = 1
  p.name = 'Internet access'
  p.customer_id = 1
  p.location_id = 2
  p.location_coordinates = nil
  p.enabled = true
  p.probe_type_id = 1
  p.probe_configuration_id = 1
end
Probe.create! do |p|
  p.id = 2
  p.name = 'Dev probe'
  p.customer_id = 1
  p.location_id = 2
  p.location_coordinates = nil
  p.probe_type_id = 2
  p.enabled = false
  p.probe_configuration_id = 2
  p.cell_number = "+49 1522 5839733"
end
Probe.create! do |p|
  p.id = 3
  p.name = 'Dalitso Water tank'
  p.customer_id = 2
  p.location_id = 4
  p.location_coordinates = nil
  p.probe_type_id = 3
  p.enabled = true
  p.probe_configuration_id = 3
end
Probe.create! do |p|
  p.id = 4
  p.name = 'Internet access'
  p.customer_id = 2
  p.location_id = 4
  p.location_coordinates = nil
  p.probe_type_id = 1
  p.enabled = false
  p.probe_configuration_id = 1
end
Probe.create! do |p|
  p.id = 5
  p.name = 'Backup batteries server room'
  p.customer_id = 2
  p.location_id = 4
  p.location_coordinates = nil
  p.probe_type_id = 5
  p.enabled = true
  p.probe_configuration_id = 4
end
Probe.create! do |p|
  p.id = 6
  p.name = 'Temperature lab'
  p.customer_id = 2
  p.location_id = 4
  p.location_coordinates = nil
  p.probe_type_id = 2
  p.enabled = true
  p.probe_configuration_id = 5
  p.forward_subscription_id = 2
end
Probe.create! do |p|
  p.id = 7
  p.name = 'Water MTE'
  p.customer_id = 2
  p.location_id = 6
  p.location_coordinates = nil
  p.probe_type_id = 3
  p.enabled = false
  p.probe_configuration_id = 3
end
Probe.create! do |p|
  p.id = 8
  p.name = 'Escom power Lisungwi'
  p.customer_id = 2
  p.location_id = 5
  p.location_coordinates = nil
  p.probe_type_id = 4
  p.enabled = true
  p.probe_configuration_id = 6
end
Probe.create! do |p|
  p.id = 9
  p.name = 'OpenMRS Upper Neno'
  p.customer_id = 2
  p.location_id = 4
  p.location_coordinates = nil
  p.probe_type_id = 6
  p.enabled = true
  p.probe_configuration_id = 7
end
Probe.create! do |p|
  p.id = 10
  p.name = 'Xians mobile phone HC survey'
  p.customer_id = 1
  p.location_id = 2
  p.location_coordinates = nil
  p.probe_type_id = 7
  p.enabled = true
  p.probe_configuration_id = 8
  p.cell_number = ""
  p.forward_subscription_id = 1
end
Probe.create! do |p|
  p.id = 11
  p.name = 'Internet speed'
  p.customer_id = 1
  p.location_id = 2
  p.location_coordinates = nil
  p.probe_type_id = 8
  p.enabled = true
  p.probe_configuration_id = 9
  p.cell_number = ""
end
Probe.create! do |p|
  p.id = 12
  p.name = 'GSM Ethernet Gateway'
  p.customer_id = 1
  p.location_id = 2
  p.location_coordinates = nil
  p.probe_type_id = 9
  p.enabled = true
  p.probe_configuration_id = 10
  p.cell_number = "+4915225839733"
  p.forward_subscription_id = 1
end
Probe.create! do |p|
  p.id = 13
  p.name = 'GSM Ethernet Gateway'
  p.customer_id = 1
  p.location_id = 4
  p.location_coordinates = nil
  p.probe_type_id = 9
  p.enabled = true
  p.probe_configuration_id = 10
  p.cell_number = "+265881007201"
  p.forward_subscription_id = 2
end
Probe.create! do |p|
  p.id = 14
  p.name = 'Boi chemistry regents Fridge'
  p.customer_id = 2
  p.location_id = 4
  p.location_coordinates = nil
  p.probe_type_id = 11
  p.enabled = true
  p.probe_configuration_id = 12
  p.cell_number = "+265881007201"
  p.forward_subscription_id = 2
end
Probe.create! do |p|
  p.id = 15
  p.name = 'Lisungwi Hospital Female ward temperature monitor'
  p.customer_id = 2
  p.location_id = 5
  p.location_coordinates = nil
  p.probe_type_id = 2
  p.enabled = true
  p.probe_configuration_id = 13
  p.cell_number = "+265881007201"
  p.forward_subscription_id = 2
end
Probe.create! do |p|
  p.id = 16
  p.name = 'Solar power DC available'
  p.customer_id = 3
  p.location_id = 7
  p.location_coordinates = nil
  p.probe_type_id = 11
  p.enabled = true
  p.probe_configuration_id = 14
  p.cell_number = ""
  p.forward_subscription_id = 3
end

ProbeConfiguration.delete_all
ProbeConfiguration.create! do |pc|
  pc.id = 1
  pc.name = "Default Internet access"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = 300 
  pc.alarm_interval = 60
  pc.value1_threshold = 17
  pc.value2_threshold = 18000
  pc.value3_threshold = nil
  pc.value4_threshold = nil
end
ProbeConfiguration.create! do |pc|
  pc.id = 2
  pc.name = "Dev probe"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = nil
  pc.alarm_interval = nil
  pc.value1_threshold = nil
  pc.value2_threshold = nil
  pc.value3_threshold = nil
  pc.value4_threshold = nil
end
ProbeConfiguration.create! do |pc|
  pc.id = 3
  pc.name = "Default Water tank"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = nil
  pc.alarm_interval = nil
  pc.value1_threshold = nil
  pc.value2_threshold = nil
  pc.value3_threshold = nil
  pc.value4_threshold = nil
end
ProbeConfiguration.create! do |pc|
  pc.id = 4
  pc.name = "Default batteries"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = nil
  pc.alarm_interval = nil
  pc.value1_threshold = 11
  pc.value2_threshold = 22
  pc.value3_threshold = 33
  pc.value4_threshold = 44
end
ProbeConfiguration.create! do |pc|
  pc.id = 5
  pc.name = "Default Temperature"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = 14400
  pc.alarm_interval = 60
  pc.value1_threshold = 23
  pc.value2_threshold = nil
  pc.value3_threshold = nil
  pc.value4_threshold = nil
end
ProbeConfiguration.create! do |pc|
  pc.id = 6
  pc.name = "Default AC power availability"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = 14400
  pc.alarm_interval = 60
  pc.value1_threshold = 1
  pc.value2_threshold = nil
  pc.value3_threshold = nil
  pc.value4_threshold = nil
end
ProbeConfiguration.create! do |pc|
  pc.id = 7
  pc.name = "Default OpenMRS"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = nil
  pc.alarm_interval = nil
  pc.value1_threshold = nil
  pc.value2_threshold = nil
  pc.value3_threshold = nil
  pc.value4_threshold = nil
end
ProbeConfiguration.create! do |pc|
  pc.id = 8
  pc.name = "Mobile phone survey"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = nil
  pc.alarm_interval = nil
  pc.value1_threshold = 20
  pc.value2_threshold = 1
  pc.value3_threshold = 1
  pc.value4_threshold = 1
end
ProbeConfiguration.create! do |pc|
  pc.id = 9
  pc.name = " Default Internet Speed"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = 3600
  pc.alarm_interval = 60
  pc.value1_threshold = 20
  pc.value2_threshold = 1
  pc.value3_threshold = 1
  pc.value4_threshold = 1
end
ProbeConfiguration.create! do |pc|
  pc.id = 10
  pc.name = "GSM Ethernet Gateway"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = nil
  pc.alarm_interval = nil
  pc.value1_threshold = 20
  pc.value2_threshold = 1
  pc.value3_threshold = 1
  pc.value4_threshold = 1
end
ProbeConfiguration.create! do |pc|
  pc.id = 11
  pc.name = "Environmental"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = nil
  pc.alarm_interval = nil
  pc.value1_threshold = 2
  pc.value2_threshold = 8
  pc.value3_threshold = nil
  pc.value4_threshold = nil
end
ProbeConfiguration.create! do |pc|
  pc.id = 12
  pc.name = "???"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = 28800
  pc.alarm_interval = nil
  pc.value1_threshold = 8
  pc.value2_threshold = nil
  pc.value3_threshold = nil
  pc.value4_threshold = nil
end
ProbeConfiguration.create! do |pc|
  pc.id = 13
  pc.name = "Lisungwi hospital female ward temp monitor"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = nil
  pc.alarm_interval = nil
  pc.value1_threshold = 25
  pc.value2_threshold = 20
  pc.value3_threshold = 18
  pc.value4_threshold = nil
end
ProbeConfiguration.create! do |pc|
  pc.id = 14
  pc.name = "DC power available"
  pc.rule_warning = ""
  pc.rule_error = ""
  pc.rule_ok = ""
  pc.rule_assumed = ""
  pc.heartbeat_interval = nil
  pc.alarm_interval = nil
  pc.value1_threshold = 1
  pc.value2_threshold = nil
  pc.value3_threshold = nil
  pc.value4_threshold = nil
end

Subscription.delete_all
Subscription.create! do |s|
  s.id = 1
  s.name = "marsmonitoring development"
  s.subscriber1_id = 1
  s.subscriber2_id = nil
  s.subscriber3_id = nil
  s.subscriber4_id = nil
  s.subscriber5_id = nil
end
Subscription.create! do |s|
  s.id = 2
  s.name = "marsmonitoring"
  s.subscriber1_id = 1
  s.subscriber2_id = 2
  s.subscriber3_id = nil
  s.subscriber4_id = nil
  s.subscriber5_id = nil
end
Subscription.create! do |s|
  s.id = 3
  s.name = "Douglas & Co"
  s.subscriber1_id = 1
  s.subscriber2_id = 9
  s.subscriber3_id = nil
  s.subscriber4_id = nil
  s.subscriber5_id = nil
end
User.delete_all

#=begin
# my test env
sql = <<-SQL
      insert into users (id, customer_id, name, created_at, updated_at, email, mobile_number, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email) values (1,1,"xian", "2015-02-19 04:48:50.946006", "2015-02-19 04:48:50.946006", "cneumann@marsmonitoring.com", "", "$2a$10$5YxGXV84mjVWh90YS6Nen.6SKJl9h/KKN8DEyMB2kMDq7FJEj4rIG", NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, "2015-02-19 04:48:50.946006", "2015-02-19 04:48:50.946006", NULL);
    SQL
    # used to connect active record to the database
    ActiveRecord::Base.establish_connection
    ActiveRecord::Base.connection.execute(sql)
#=end    

=begin
# production env
sql = <<-SQL
      insert into users (id, customer_id, name, created_at, updated_at, email, mobile_number, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email) values (1,1,"xian", "2015-02-19 04:48:50.946006", "2015-02-19 04:48:50.946006", "cneumann@marsmonitoring.com", "", "$2a$10$ITPVcPwh7XFE91gijP2BWO6k7KHBsLCZqkWF6RAJ.iCOe1csRzpRi", NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, "2015-02-19 04:48:50.946006", "2015-02-19 04:48:50.946006", NULL), (2,1,"stevovo", "2015-02-19 04:48:50.946006", "2015-02-19 04:48:50.946006", "stevemtewa@gmail.com", "", "$2a$10$B.2SY553u3e5fkCPIMu4bud06hElvMqaLlrGBv6KnCglEox/52fWe", NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, "2015-02-19 04:48:50.946006", "2015-02-19 04:48:50.946006", NULL), (3,3,"Gerry Douglas", "2015-02-19 04:48:50.946006", "2015-02-19 04:48:50.946006", "christian.neumann@gmail.com", "", "e6e9832057cdc3b114efa779cdc01e9c216039b3834df017e825e7f175dd39c1", NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, "2015-02-19 04:48:50.946006", "2015-02-19 04:48:50.946006", NULL);
      SQL
      # used to connect active record to the database
      ActiveRecord::Base.establish_connection
      ActiveRecord::Base.connection.execute(sql)
=end

=begin        
User.create(validation : false) do |s|
  s.id = 1
  s.customer_id = 1
  s.name = "xian"
  s.email = "cneumann@marsmonitoring.com"
  s.encrypted_password = "$2a$10$ITPVcPwh7XFE91gijP2BWO6k7KHBsLCZqkWF6RAJ.iCOe1csRzpRi"
#  s.password = "neumann"
#  s.password_confirmation = "neumann"
  s.mobile_number = ""
end
User.create! do |s|
  s.id = 2
  s.customer_id = 1
  s.name = "stevovo"
  s.email = "smtewa@marsmonitoring.com"
  s.encrypted_password = "$2a$10$B.2SY553u3e5fkCPIMu4bud06hElvMqaLlrGBv6KnCglEox/52fWe"
end
User.create! do |s|
  s.id = 7
  s.customer_id = 1
  s.name = "xian"
  s.email = "christian.neumann@gmail.com"
  s.mobile_number = ""
  s.encrypted_password = "$2a$10$ITPVcPwh7XFE91gijP2BWO6k7KHBsLCZqkWF6RAJ.iCOe1csRzpRi"
end
User.create! do |s|
  s.id = 8
  s.customer_id = 1
  s.name = ""
  s.email = "stevemtewa@gmail.com"
  s.mobile_number = ""
  s.encrypted_password = "$2a$10$B.2SY553u3e5fkCPIMu4bud06hElvMqaLlrGBv6KnCglEox/52fWe"
end
User.create! do |s|
  s.id = 9
  s.customer_id = 3
  s.name = "Gerry Douglas"
  s.email = "christian.neumann@gmx.de"
  s.mobile_number = ""
  s.encrypted_password = "e6e9832057cdc3b114efa779cdc01e9c216039b3834df017e825e7f175dd39c1"
end
=end