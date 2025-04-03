*Part 1*
The goal here is creating one cluster consisting of two nodes: a master and a worker. Each node runs on a VM provisioned by Vagrant.

**Vagrantfile**

The configuration sets up two VMs connected to a private network. They run a lightweight linux image and they use 1 cpu and 1024MB of memory.

- jchamakS: The master node. Its IP is 192.168.56.110 and it creates the authentication token in the k3s installation process. This token is shared with the worker using a synced folder.
- jchamakSW: The worker node. Its IP is 192.168.56.111 and it uses the authentication token previously generated.

**Scripts**

The scripts folder contains one script per VM. These are used at startup time to install k3s and set up the cluster.

- `master.sh`: Runs the k3s server installation with the kubeconfig mode allowing the reading of the kubeconfig file. This allows the usage of the kubectl utility as any user. It copies the authentication token file generated to the synced folder.

- `agent.sh`: Runs the k3s agent installation. It contains the server address and the authentication token file location.