
# 1. Update system
sudo dnf update -y

# 2. Install Java 21 and fontconfig
sudo dnf install -y fontconfig java-21-amazon-corretto

# 3. Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/rpm-stable/jenkins.repo

# 4. Import Jenkins signing key
sudo rpm --import \
https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key

# 5. Download Jenkins RPM from India mirror
sudo curl -fL \
https://mirrors.in2.sahilister.net/jenkins/rpm-stable/jenkins-2.580.2-1.noarch.rpm \
-o /tmp/jenkins.rpm

# 6. Verify RPM signature
sudo rpm --checksig -v /tmp/jenkins.rpm

# 7. Install Jenkins
sudo dnf install -y /tmp/jenkins.rpm

# 8. Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# 9. Check Jenkins status
sudo systemctl status jenkins

# 10. Get initial admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
