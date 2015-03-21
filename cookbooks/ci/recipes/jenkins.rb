include_recipe 'apt'

package 'openjdk-7-jre'

include_recipe 'jenkins::master'

jenkins_plugin 'delivery-pipeline-plugin'
jenkins_plugin 'build-pipeline-plugin' do
  notifies :restart, 'service[jenkins]'
end

cookbook_file "/tmp/commit-stage-config.xml" do
  source "commit-stage-config.xml"
end

jenkins_job "Blog - Commit" do
  config "/tmp/commit-stage-config.xml"
end

group 'vagrant' do
  action :modify
  members 'jenkins'
  append true
  notifies :restart, 'service[jenkins]'
end
