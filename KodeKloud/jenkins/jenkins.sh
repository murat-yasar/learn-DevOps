# Install the EPEL (Extra Packages for Enterprise Linux) repository
sudo yum install epel-release -y

# Installs OpenJDK 17 which is needed to run Jenkins
sudo yum install fontconfig java-17-openjdk -y

# Check Java version
java -version

# Add the official Jenkins repository so that yum can find and install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo --no-check-certificate

# Import the GPG key used to sign the Jenkins packages
sudo rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install jenkins
sudo yum install jenkins -y

# Update the default Jenkins port to 8090 by changing:  Environment="JENKINS_PORT=8090"
sudo vi /lib/systemd/system/jenkins.service

# Start Jenkins service
sudo systemctl start jenkins


