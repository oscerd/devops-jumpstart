set :application, 'Blog'
set :keep_releases, 2
set :format, :pretty
set :user, 'deploy'
set :use_sudo, false

set :deploy_to, '/home/deploy'
set :scm, :copy

namespace :deploy do
  task :stop_server do
    on roles(:app) do
      within release_path do
        rake 'stop'
      end
    end
  end

  task :migrate_db do
    on roles(:app) do
      within release_path do
        rake 'db:migrate'
      end
    end
  end

  task :start_server do
    on roles(:app) do
      within release_path do
        rake 'start'
      end
    end
  end

  before :updated, :stop_server
  after :updated, :migrate_db
  after :finished, :start_server
end
