require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-1.9.3-p125'
require "bundler/capistrano"
set :application, "corporativeweb"
set :domain, "mail.galiclick.com"
set :user, "galiclick"
set :port, 61323
set :repository,  "git@github.com:jgamsan/corporativeweb.git"
set :scm, :git
set :keep_releases, 2
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, false
set :deploy_via, :remote_cache
set :deploy_to, "/home/galiclick/public_html/#{application}"
set :rails_env, "production"

role :web, domain
role :app, domain
role :db,  domain, :primary => true

after "deploy", "deploy:cleanup"
require 'capistrano-unicorn'
