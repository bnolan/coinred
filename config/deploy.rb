set :application, "coinred"
set :repository,  "git@github.com:bnolan/coinred.git"

set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "beta"                          # Your HTTP server, Apache/etc
role :app, "beta"                          # This may be the same as your `Web` server
role :db,  "beta", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

set :scm, :git
set :branch, "master"
set :git_enable_submodules, 1
set :scm_verbose, true


default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :deploy_to, "~/coinred"
set :deploy_via, :remote_cache
set :use_sudo, false

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    # run "ln -s /home/ben/placepinner/shared/uploads #{File.join(current_path,'public','uploads')}"
  end
end