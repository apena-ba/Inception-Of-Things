- *VAGRANT*

- **TODO LIST**

1. Ruby syntax
2. Configuration settings -> How does Vagrant use Ruby?
3. How does vagrant work when launched?

- **Command cheatsheet**

vagrant up
vagrant global-status
vagrant destroy [ID]

vagrant destroy --force $(vagrant global-status | awk '{print $1}' | head -3 | tail -1)

- **Vagrantfile**

Vagrant.configure("2") do |config|
  # Image
  config.vm.box = "hashicorp/bionic64"

  # VM resources
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512" # Set RAM to 512MB
    vb.cpus = 1
    vb.name = "jchamak"
    vb.hostname = "jchamakS"
  end
end
