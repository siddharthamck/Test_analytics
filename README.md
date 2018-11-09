# CI/CD repository for Analyitics Automation

# Pre-requisistes 

1. Ubuntu machine (either AWS/Azure/VM) to run Dokku


# Dokku Setup instructions 

1. Fire up an instance with Ubuntu 14.04 with 2 GB RAM on AWS/Azure. Ensure that port 22 and 80 are open.
2. In Terminal Execute - `wget https://raw.githubusercontent.com/dokku/dokku/v0.12.13/bootstrap.sh`
3. In Terminal Execute - `sudo DOKKU_TAG=v0.12.13 bash bootstrap.sh`
4. Open browser in your local system and browse to the IP of the server which has Dokku installed. Http://<ip of server>. This will show up configuration options related to virtual host. Hit continue and its done.
5. In local system Terminal, execute `ssh-keygen -t rsa -b 4096 -C "your_login_id@x.y`
6. As next step execute `cat ~/.ssh/id_rsa.pub | ssh -i keyfile.pem ubuntu@<server ip> "sudo sshcommand acl-add dokku personal"`
  
 
# After Dokku is setup 
1. Create the app by doing a SSH into the dokku server and create an app using the command - `dokku apps:create python-sample`
2. Configure your local environment to push builds to Dokku `git remote add dokku dokku@<server ip>:node-sample`

# Accessing the Notebook running on Dokku 
1. The deployed notebook will be available at `http://ip-address:8082` 
(Token will be available from doku logs, this is a workaround until jupyter security configuration is completed)

# Other Dokku commands - 
1. To rebuild after a successful deploy - `dokku ps:rebuild python-sample`
2. To view Dokku logs - `dokku logs python-sample`
 
# Developer usage instructions - 
1. Save, and commit your notebook 
2. Publish to Dokku using - `git push dokkus master`
3. Navigate to notebook using the URL 

# Next Steps 
1. Automate and parameterise execution through Papermill
2. Schedule runs using dokku run, and cron schedules
3. Add jupyter notebook security
4. Support for branches - dev, test and prod 
5. SUpport for data environments - dev, test and prod

# To run commands, e.g. papermill 
1. To run a notebook using papermill`dokku run python-sample papermill my_book.ipynb /tmp/a.json`
2. To run in existing container - 
  `dokku enter  python-sample web`
  `papermill my_book.ipynb /tmp/a.json`
  `cat /tmp/a.json`
  
# To run in Kubernetes using minikube (steps might need revision/corrections)
1.Deploy container on Kubernetes - `kubectl run python-app --image=siddhartharai/company:latest --port=8081`
2.To  open app in browser - `minikube service python-app`
3.To execute `kubectl exec python-app-787c4c876b-fcwqd papermill my_book.ipynb /tmp/a.json`
4.To see results - `kubectl exec python-app-787c4c876b-fcwqd cat /tmp/a.json`
