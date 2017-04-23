# Features

- Deploys Jenkins to fresh installations of Ubuntu 16.04 or Centos7 using the .provision/jenkins.sh script.
- Vagrantfiles in the Ubuntu & Centos directories call the script.
- Network interfaces on the Vagrant boxes will be provisioned on the same network as the host.
- Jenkins is configured to use port 8000 as opposed to the standard port 8080.
- The provision script can also be applied directly to a CentOS or Ubuntu server.
- The provision script is also hosted via S3 at https://s3-us-west-2.amazonaws.com/deploy-jenkins/deploy-jenkins.sh and can invoked as follows:
- $ curl https://s3-us-west-2.amazonaws.com/deploy-jenkins/deploy-jenkins.sh | sudo bash

# Installation options

This script is designed to deploy the Jenkins application, along with prerequisites on either CentOS or Ubuntu systems.

- Vagrant

For Vagrant-based installations, navigate to the CentOS or Ubuntu directory and issue the command:

`$ vagrant up`

The vagrant file will provision the chosen operating system and automatically invoke the cross-platform Jenkins installation script.

Once complete, the console will display both the IP address of the Jenkins server and the randomly generated administrator password.

- Non-Vagrant

The installer script can also be used on a CentOS or Ubuntu system not hosted in Vagrant. On an internet-connected system issue the following command:

`$ curl https://s3-us-west-2.amazonaws.com/deploy-jenkins/deploy-jenkins.sh | sudo bash`

This will perform the same installation as the Vagrant option.

Once complete, the console will display both the IP address of the Jenkins server and the randomly generated administrator password.
