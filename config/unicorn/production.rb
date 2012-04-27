wd = "/home/galiclick/public_html/corporativeweb/current"
working_directory wd
pid "#{wd}/tmp/pids/unicorn.pid"
stderr_path "#{wd}/log/unicorn.log"
stdout_path "#{wd}/log/unicorn.log"
preload_app true
listen "#{wd}/tmp/unicorn.todo.sock"
worker_processes 2
timeout 30
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end
after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

