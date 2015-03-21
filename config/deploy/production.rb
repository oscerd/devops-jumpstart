set :rack_env, 'production'

role :app, %w{deploy@192.168.42.40}
