Vagrant.configure("2") do |config|
  # Image and disk size
  config.vm.box = "hashicorp/bionic64"

  # VM resources
  config.vm.provider("virtualbox") do |vb|
    vb.memory = "512" # Set RAM to 1GB
    vb.cpus = 1
  end

  # Network
  config.vm.define("jchamakS") do |master|
    #master.vm.name = "jchamakS"
    master.vm.hostname = "jchamakS"
    master.vm.network("public_network", bridge: "enp6s0", ip: "192.168.56.110", hostname: true)
    
    # Boot time script
    master.vm.provision("shell", privileged: true, path: "./scripts/server-master.sh")
  end
  
  config.vm.define("jchamakSW") do |agent|
    #agent.vm.name = "jchamakSW"
    agent.vm.hostname = "jchamakSW"
    agent.vm.network("public_network", bridge: "enp6s0", ip: "192.168.56.111", hostname: true)
  
    # Boot time script
    agent.vm.provision("shell", privileged: true, path: "./scripts/server-worker.sh")
  end
end
