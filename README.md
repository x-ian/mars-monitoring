mars-monitoring
===============

cap production deploy

bundle exec rake db:seed RAILS_ENV=production --trace

sqlite3 db/develpment.sq3

mysqldump --no-create-info --skip-extended-insert  --complete-insert --skip-add-locks  --compatible=ansi -u neumann marsmonitoring_production messages probe_configurations probe_types probes value_types  | sed "s/\\\'/''/g"  >/tmp/localdb.txt
Add delete from ... before every new INSERT block

* https://github.com/seyhunak/twitter-bootstrap-rails
* https://javierdechile.wordpress.com/2013/06/06/the-next-step-after-the-scaffold/

Run ActiveJobs on OSX from commandline:
```
cd /Users/xian/projects/mars-monitoring/mars-monitoring && /usr/local/rvm/gems/ruby-2.2.6/bin/rails runner -e production CheckForOfflineProbesJob.perform_now
```

(Re) generate controller & bootstrap
```
script/rails generate scaffold_controller CommunicationChannel name:text
rails g bootstrap:themed CommunicationChannels

script/rails generate scaffold_controller Customer name:text
rails g bootstrap:themed Customers

script/rails generate scaffold_controller Event name:text
rails g bootstrap:themed Events

script/rails generate scaffold_controller InvalidMessage read:boolean reason:text content:text source:text
rails g bootstrap:themed InvalidMessages

script/rails generate scaffold_controller Location customer_id:number name:text parent-location_id:number
rails g bootstrap:themed Locations

script/rails generate scaffold_controller MessageType name:text
rails g bootstrap:themed MessageTypes

script/rails generate scaffold_controller Message name:text
rails g bootstrap:themed Messages

script/rails generate scaffold_controller ProbeConfiguration name:text rule_ok:text rule_warning:text rule_error:text rule_assumed:text heartbeat_interval:number alarm_interval:number value1_threshold:text value2_threshold:text value3_threshold:text value4_threshold:text value5_threshold:text value6_threshold:text value7_threshold:text value8_threshold:text value9_threshold:text value10_threshold:text value11_threshold:text value12_threshold:text value13_threshold:text value14_threshold:text value15_threshold:text value16_threshold:text 
rails g bootstrap:themed ProbeConfigurations

script/rails generate scaffold_controller ProbeType name:text description:text communication_channel_id:text value1_type_id:text value2_type_id:text value3_type_id:text value4_type_id:text value5_type_id:text value6_type_id:text value7_type_id:text value8_type_id:text value9_type_id:text value10_type_id:text value11_type_id:text value12_type_id:text value13_type_id:text value14_type_id:text value15_type_id:text value16_type_id:text
rails g bootstrap:themed ProbeTypes

script/rails generate scaffold_controller Probe id:number name:text customer_id:text location_id:text probe_type_id:text probe_configuration_id:text forward_subscription_id:text location_coordinates:text responsible_user_id:text enabled:boolean cell_number:text
rails g bootstrap:themed Probes

script/rails generate scaffold_controller Subscription name:text subscriber1_id:text subscriber2_id:text subscriber3_id:text subscriber3_id:text subscriber4_id:text subscriber5_id:text include_heartbeat:boolean include_alarm:boolean include_restart:boolean
rails g bootstrap:themed Subscriptions

script/rails generate scaffold_controller User customer_id:text name:text org_unit:text email:text mobile_number:text role:text time_zone:text
rails g bootstrap:themed Users

script/rails generate scaffold_controller ValueType name:text cumulative:boolean description:text
rails g bootstrap:themed ValueTypes

script/rails generate scaffold_controller ProbeStatus name:text status:text assumed:boolean severity_order:number
rails g bootstrap:themed ProbeStatuses
```
