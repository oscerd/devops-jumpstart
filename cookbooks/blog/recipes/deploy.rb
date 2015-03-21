user 'deploy' do
  home '/home/deploy'
  supports :manage_home => true
  action [ :create, :manage ]
end

directory '/home/deploy/.ssh' do
  owner 'deploy'
  mode 0755
  action :create
  not_if { File.exists? '/home/deploy/.ssh' }
end

cookbook_file '/home/deploy/.ssh/authorized_keys' do
  source 'authorized_keys'
  owner 'deploy'
  mode 0600
  action :create
end
