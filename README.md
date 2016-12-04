mars-monitoring
===============

cap production deploy

bundle exec rake db:seed RAILS_ENV=production --trace

sqlite3 db/develpment.sq3

mysqldump --no-create-info --skip-extended-insert  --complete-insert --skip-add-locks  --compatible=ansi -u neumann marsmonitoring_production messages probe_configurations probe_types probes value_types  | sed "s/\\\'/''/g"  >/tmp/localdb.txt
Add delete from ... before every new INSERT block
