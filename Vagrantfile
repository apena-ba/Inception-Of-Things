Vagrant.configure("2") do |config|
  config.vm.define("jchamakS") do |master|
    master.vm.box = "hashicorp/bionic64"
    master.vm.hostname = "jchamakS"
    master.vm.synced_folder ".", "/vagrant"
    master.vm.network("private_network", ip: "192.168.56.110")

    master.vm.provider("virtualbox") do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end
    
    master.vm.provision("shell", privileged: true, path: "./scripts/k3s-server.sh", args: ["192.168.56.110"])
  end
  
  config.vm.define("jchamakSW") do |agent|
    agent.vm.box = "hashicorp/bionic64"
    agent.vm.hostname = "jchamakSW"
    agent.vm.synced_folder ".", "/vagrant"
    agent.vm.network("private_network", ip: "192.168.56.111")

    agent.vm.provider("virtualbox") do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end
  
    agent.vm.provision("shell", privileged: true, path: "./scripts/k3s-worker.sh", args: ["192.168.56.110", "192.168.56.111"])
  end
end
