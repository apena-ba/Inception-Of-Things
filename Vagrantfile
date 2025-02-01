Vagrant.configure("2") do |config|
  # Image
  config.vm.box = "hashicorp/bionic64"

  # Network
  config.vm.hostname = "jchamakS"
  config.vm.network("public_network", ip: "192.168.56.110", hostname: true)
  
  # VM resources
  config.vm.provider("virtualbox") do |vb|
    vb.memory = "2048" # Set RAM to 512MB
    vb.cpus = 2
    vb.name = "jchamak"
  end

  config.vm.define("jchamak") do |server|
    #server.vm.synced_folder("./scripts", "/vagrant/scripts")
    server.vm.provision("shell", privileged: true, path: "./scripts/server-master.sh")
  end
end
