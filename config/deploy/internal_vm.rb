# deploys to DCE sandbox
set :stage, :internal_vm
set :rails_env, 'production'
server '127.0.0.1', user: 'deploy', roles: [:web, :app, :db]