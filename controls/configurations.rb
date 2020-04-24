jenkins_home_path = input(
  'jenkins_home_path',
  value: '/var/lib/jenkins',
  description: 'Jenkins HOME directory. (differs in Docker: /var/jenkins_home/'
)

title 'Jenkins-CI Server configuration checks (XML files)'

control 'cc-jenkins-config-denyAnonymousReadAccess' do

  title "denyAnonymousReadAccess or Global | Project Matrix Authorization Strategy should be configured"

  ## One of:
  describe.one do
    describe xml(jenkins_home_path + '/config.xml') do
      its('hudson/authorizationStrategy/denyAnonymousReadAccess') { should eq ['true'] }
    end

    describe xml(jenkins_home_path + '/config.xml') do
      its('hudson/authorizationStrategy/@class') { should cmp /hudson\.security\.(Global|Project)MatrixAuthorizationStrategy/ }
    end
  end

end

control 'cc-jenkins-config-useSecurity' do

  title "Security must be turned on"

  describe xml(jenkins_home_path + '/config.xml') do
    its('hudson/useSecurity') { should eq ['true'] }
  end

end

control 'cc-jenkins-config-disableSignup' do

  title "Signup must be disabled"

  describe xml(jenkins_home_path + '/config.xml') do
    its('hudson/securityRealm/disableSignup') { should eq ['true'] }
  end

end

control 'cc-jenkins-config-enableCaptcha' do

  title "Captcha should be turned off"

  describe xml(jenkins_home_path + '/config.xml') do
    its('hudson/securityRealm/enableCaptcha') { should eq ['false'] }
  end

end

control 'cc-jenkins-config-enable-remote-CLI' do

  title "Remote CLI access must be disabled"

  describe xml(jenkins_home_path + '/jenkins.CLI.xml') do
    its(['jenkins.CLI/enabled']) { should eq ['false'] }
  end

end
