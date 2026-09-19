#STEP-1: INSTALLING GIT 
yum install git  -y

#STEP-2: GETTING THE REPO (jenkins.io --> download -- > redhat)
sudo wget -O /etc/yum.repos.d/jenkins.repo     https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key

#STEP-3: DOWNLOAD JAVA11 AND JENKINS
yum install java-21-amazon-corretto -y
yum install jenkins -y

#STEP-4: RESTARTING JENKINS (when we download service it will on stopped state)
systemctl enable jenkins
systemctl start jenkins
systemctl status jenkins
