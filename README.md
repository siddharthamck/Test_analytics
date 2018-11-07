# CI/CD repository for Analyitics Automation

* Pre-requisistes 

1. Ubunto machine (either AWS/Azure/VM) to run Dokku


Dokku Setup instructions 

Fire up an instance with Ubuntu 14.04 with 2 GB RAM on AWS/Azure. Ensure that port 22 and 80 are open.
In Terminal Execute - wget https://raw.githubusercontent.com/dokku/dokku/v0.12.13/bootstrap.sh
In Terminal Execute - sudo DOKKU_TAG=v0.12.13 bash bootstrap.sh
Open browser in your local system and browse to the IP of the server which has Dokku installed. Http://<ip of server>. This will show up configuration options related to virtual host. Hit continue and its done.
In local system Terminal, execute ssh-keygen -t rsa -b 4096 -C "your_login_id@x.y"
As next step execute cat ~/.ssh/id_rsa.pub | ssh -i keyfile.pem ubuntu@<server ip> "sudo sshcommand acl-add dokku personal"
  
  
  
  

After Dokku is setup 
Create the app by doing a SSH into the dokku server and create an app using the command - dokku apps:create node-sample
Configure your local environment to push builds to Dokku git remote add dokku dokku@<server ip>:node-sample

Accessing the Notebook running on Dokku 
The deployed notebook will be available at http://ip-address:8082

Other Dokku commands - 
1. To rebuild after a successful deploy - dokku ps:rebuild python-sample
2. 

