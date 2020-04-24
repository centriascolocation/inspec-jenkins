title 'Jenkins-CI Server installation security checks'

control 'cc-jenkins-base-group' do

  impact 1.0
  title "Jenkins OS Group"
  desc "Checks if Jenkins group exists"

  describe group('jenkins') do
    it { should exist }
    its('gid') { should_not eq 0 }
  end

end

control 'cc-jenkins-base-user' do

  impact 1.0
  title "Jenkins OS User"
  desc "Checks if Jenkins user exists"

  describe user('jenkins') do
    it { should exist }
    its('group') { should eq 'jenkins' }
    its('shell') { should eq '/bin/bash' }
  end

  describe.one do
    ## typical package installation:
    describe user('jenkins') do
      its('home') { should eq '/var/lib/jenkins' }
    end

    ## typical Docker installation:
    describe user('jenkins') do
      its('home') { should eq '/var/jenkins_home' }
    end
  end

end

control 'cc-jenkins-base-security-admin-user' do

  impact 1.0
  title "Admin User exists"
  desc ""

end
