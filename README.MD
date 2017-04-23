*Deploys Jenkins to fresh installations of Ubuntu 16.04 or Centos7 using the .provision/jenkins.sh script.
*Vagrantfiles in the Ubuntu & Centos directories call the script.
*Network interfaces on the Vagrant boxes will be provisioned on the same network as the host. 
*Jenkins is configured to use port 8000 as opposed to the standard port 8080.
*The provision script can also be applied directly to a Centos or Ubuntu server.
*The provision script is also hosted via S3 at https://s3-us-west-2.amazonaws.com/deploy-jenkins/jenkins.sh and can invoked as follows:
*$ curl https://s3-us-west-2.amazonaws.com/deploy-jenkins/jenkins.sh | sudo bash
