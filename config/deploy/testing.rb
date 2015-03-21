set :rack_env, 'test'

role :app, %w{deploy@192.168.42.30}
