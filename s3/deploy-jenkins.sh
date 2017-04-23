#!/usr/bin/env bash

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

  ip="$(hostname -I | awk '{ print $1 }')"
  echo Installing Jenkins on host with IP $ip

if [ -f /etc/redhat-release ]; then

  echo 'Installing wget'
  sudo yum -y install wget

  echo 'Installing Java'
  sudo yum -y install java

  echo 'Downloading Jenkins Repository'
  sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo > /dev/null

  echo 'Importing verification key'
  sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key > /dev/null

  echo 'Updating yum'
  yum -y update

  echo 'Installing Jenkins'
  sudo yum -y install jenkins

  echo 'Changing Jenkins Port to 8000'
  sudo sed -i 's/JENKINS_PORT="8080"/JENKINS_PORT="8000"/' /etc/sysconfig/jenkins

  echo 'Starting Jenkins Service'
  sudo systemctl start jenkins.service

  sleep 30

  sudo systemctl restart jenkins.service
fi

  if [ -f /etc/lsb-release ]; then

  echo 'Adding Java Repository'
  sudo add-apt-repository -y ppa:webupd8team/java
  sudo apt-get update
  echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

  echo 'Installing Java'
  sudo apt-get -y install oracle-java8-installer > /dev/null

  echo 'Importing verification key'
  sudo wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -

  echo 'Adding Jenkins Repository'
  sudo echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list

  echo 'Updating Apt'
  sudo apt-get -y update

  echo 'Installing Jenkins'
  sudo apt-get -y install jenkins

  echo 'Changing Jenkins Port to 8000'
  sudo sed -i 's/8080/8000/' /etc/default/jenkins

  echo 'Starting Jenkins Service'
  sudo service jenkins start

  sleep 30

  sudo service jenkins restart
fi

echo 'Browse to http://'$ip':8000 to visit your new Jenkins server'

jenkins_pass=$( cat /var/lib/jenkins/secrets/initialAdminPassword )
echo 'Your admin password is' $jenkins_pass
