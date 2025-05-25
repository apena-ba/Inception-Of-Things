## 📍 Part 3
The goal is creating the continuous deployment of an app, making use of k3d and argocd.

**🖍️ Scripts**

The scripts folder contains two scripts.

- `install.sh`: Installs every necessary package &rarr; `docker` `k3d` `kubectl` `argocd`
- `setup.sh`: Creates the kubernetes cluster running on docker, as well as the namespaces `argocd` and `dev`. It then deploys argocd and the app on their respective namespaces making sure that they are synced.

**⚙️ Configs**

This folder is used by argocd to check if synchronization is needed. 

- `deployment.yaml`: Contains the deployment and service configuration of the app, running on port 8888.