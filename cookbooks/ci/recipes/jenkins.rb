include_recipe 'apt'

package 'openjdk-7-jre'

include_recipe 'jenkins::master'

jenkins_plugin 'delivery-pipeline-plugin'
jenkins_plugin 'build-pipeline-plugin' do
  notifies :restart, 'service[jenkins]'
end

%w(commit acceptance production).each do |stage_name|
  cookbook_file "/tmp/#{stage_name}-stage-config.xml" do
    source "#{stage_name}-stage-config.xml"
  end

  jenkins_job "Blog - #{stage_name.capitalize}" do
    config "/tmp/#{stage_name}-stage-config.xml"
  end
end

group 'vagrant' do
  action :modify
  members 'jenkins'
  append true
  notifies :restart, 'service[jenkins]'
end
