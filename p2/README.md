## 📍 Part 2
The objective is to access three apps based on their hostname. The deployment is done in a single VM provisioned by Vagrant.

**📄 Vagrantfile**

Creates a VM running a lightweight linux image. It uses 1 cpu and 1024MB of memory and its IP is 192.168.56.110.

**🖍️ Scripts**

The scripts folder contains one script used at startup time to install k3s and deploy the apps.

- `master.sh`: Runs the k3s server installation and uses a template to apply the config in order to manage the three apps.

**⚙️ Configs**

The scripts folder contains one script per VM. These are used to setup the apps and configure remote access to them.

- `app-template.yaml`: Deployment and Service template used by `master.sh`. It makes use of environment variables: one for the app name and the other for the number of app replicas. Labels and selectors are used to identify objects within the cluster. The image used displays the message specified when accessing the web app.

- `ingress.yaml`: Routes the incoming traffic to the appropiate app based on the host specified in the request header.
