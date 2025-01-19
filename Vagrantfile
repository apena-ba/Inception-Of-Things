Vagrant.configure("2") do |config|
  # Image
  config.vm.box = "hashicorp/bionic64"

  # Network
  config.vm.hostname = "jchamakS"
  config.vm.network("public_network", ip: "192.168.56.110", hostname: true)
  
  # SSH
  config.ssh.password = ""
  config.ssh.insert_key = false

  # VM resources
  config.vm.provider("virtualbox") do |vb|
    vb.memory = "512" # Set RAM to 512MB
    vb.cpus = 1
    vb.name = "jchamak"
  end
end
