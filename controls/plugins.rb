jenkins_home_path = input(
  'jenkins_home_path',
  value: '/var/lib/jenkins',
  description: 'Jenkins HOME directory. (differs in Docker: /var/jenkins_home/'
)

title 'Plugins'

control 'cc-jenkins-plugins' do

  impact 0.5
  title "Common Plugins"
  desc "Jenkins should have some common plugins installed"

  describe command("ls -1 #{jenkins_home_path}/plugins/*.jpi") do
    its('stdout') { should match (/credentials.jpi$/) }
    its('stdout') { should match (/jobConfigHistory.jpi$/) }
    its('stdout') { should match (/thinBackup.jpi$/) }
    its('stdout') { should match (/ws-cleanup.jpi$/) }
  end

end
