# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'event'
set :repo_url, 'git@github.com:k1row/Event.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/events'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
#set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}

# Default value for default_env is {}
set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  #path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH:/opt/ruby/bin:$PATH:~/.rbenv/shims:~/.rbenv/bin:$PATH"
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH:/opt/ruby/bin:$PATH"
}
#set :default_env, { rvm_bin_path: '~/.rvm/bin' }

# Default value for keep_releases is 5
set :keep_releases, 5


set :linked_dirs, (fetch(:linked_dirs) + ['tmp/pids'])

# Unicorn周りの設定をする
set :unicorn_rack_env, "none"
set :unicorn_config_path, 'config/unicorn.rb'

#set :rvm1_ruby_version, "ruby-2.0.0-p247"
set :rvm1_ruby_version, "ruby-2.1.2p95"

before 'deploy', 'rvm1:install:rvm'  # install/update RVM

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')

      invoke 'unicorn:restart'
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
