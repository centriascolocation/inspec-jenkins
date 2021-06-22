title 'Jenkins-CI Server installation sanity checks'

control 'cc-jenkins-base-installation-java-version' do

  impact 1.0
  title "openjdk package installed"
  desc "Verifies JAVA installation"

  describe.one do
    # RedHat families:
    describe package('java-1.8.0-openjdk-headless') do
      it { should be_installed }
    end
    describe package('java-1.8.0-openjdk') do
      it { should be_installed }
    end
    describe package('java-11-openjdk-headless') do
      it { should be_installed }
    end
    describe package('java-11-openjdk') do
      it { should be_installed }
    end

    # Debian families:
    describe package('openjdk-8-jre-headless') do
      it { should be_installed }
    end
    describe package('openjdk-8-jre') do
      it { should be_installed }
    end
    describe package('openjdk-8-jdk-headless') do
      it { should be_installed }
    end
    describe package('openjdk-8-jdk') do
      it { should be_installed }
    end

    describe package('openjdk-11-jre-headless') do
      it { should be_installed }
    end
    describe package('openjdk-11-jre') do
      it { should be_installed }
    end
    describe package('openjdk-11-jdk-headless') do
      it { should be_installed }
    end
    describe package('openjdk-11-jdk') do
      it { should be_installed }
    end

  end

  describe command('java -version') do
    its('stderr') { should match /openjdk\s+version\s+\"(1\.8|11\.\d+)/ }
  end

end

control 'cc-jenkins-base-installation-homedir' do

  impact 1.0
  title "JENKINS_HOME directory"
  desc "Verifies dir/file permissions on JENKINS_HOME"

  describe.one do
    describe directory('/var/lib/jenkins') do
      its('owner') { should eq 'jenkins' }
    end

    describe directory('/var/jenkins_home') do
      its('owner') { should eq 'jenkins' }
    end
  end

end

control 'cc-jenkins-base-installation-secrets-directory' do

  impact 1.0
  title "secrets directory"
  desc "Verifies dir/file permissions on $JENKINS_HOME/secrets"

  describe.one do
    describe directory('/var/lib/jenkins/secrets') do
      its('owner') { should eq 'jenkins' }
      its('mode') { should cmp '0700' }
    end

    describe directory('/var/jenkins_home/secrets') do
      its('owner') { should eq 'jenkins' }
      its('mode') { should cmp '0700' }
    end
  end

end
