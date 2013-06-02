#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
require 'bundler/capistrano'
# be sure to change these
set :user, 'neumann'
set :domain, 'www.marsmonitoring.com'
set :application, 'x-ian/mars-monitoring'

# adjust if you are using RVM, remove if you are not
#require "rvm/capistrano"
#set :rvm_ruby_string, '1.9.3'
#set :rvm_type, :user

# file paths
set :repository,  "git@github.com:x-ian/mars-monitoring.git" 
#set :deploy_to, "/home/#{user}/#{domain}" 
###set :deploy_to, "/home/neumann/capistrano/mars-monitoring"

# distribute your applications across servers (the instructions below put them
# all on the same server, defined above as 'domain', adjust as necessary)
role :app, domain
role :web, domain
role :db, domain, :primary => true

# you might need to set this if you aren't seeing password prompts
default_run_options[:pty] = true

# As Capistrano executes in a non-interactive mode and therefore doesn't cause
# any of your shell profile scripts to be run, the following might be needed
# if (for example) you have locally installed gems or applications.  Note:
# this needs to contain the full values for the variables set, not simply
# the deltas.
default_environment['PATH']='/usr/local/rvm/gems/ruby-1.9.3-p194/bin:/usr/local/rvm/gems/ruby-1.9.3-p194@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p194/bin:/usr/local/rvm/bin:/usr/local/bin:/usr/bin:/bin'
default_environment['GEM_PATH']='/usr/local/rvm/gems/ruby-1.9.3-p194:/usr/local/rvm/gems/ruby-1.9.3-p194@global'
# miscellaneous options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production
set :scm_passphrase, "neumann"

task :prod do
  set :deploy_to, "/home/neumann/capistrano/mars-monitoring"
end

desc "Tweak index.html for marswatching.com"
task :marswatching_index do 
end

desc "Deploy as marswatching.com"
task :watching do
  set :deploy_to, "/home/neumann/capistrano/mars-watching"
  after "deploy" do
    run "cp /home/neumann/capistrano/mars-watching/current/public/index-marswatching.html /home/neumann/capistrano/mars-watching/current/public/index.html"
  end
end

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end

