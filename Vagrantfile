# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v|
    v.name = ENV.fetch("VAGRANT_HOSTNAME", "loris")
  end
  
  config.vm.hostname = $hostname
  config.vm.box = "ubuntu/trusty64"

  # Setup the shared folder
  home_dir = "/home/vagrant"
  config.vm.synced_folder ".", home_dir + "/loris"

  config.vm.network :forwarded_port, guest: 5004, host: 5004 # loris2

  config.vm.provider "virtualbox" do |v|
    v.memory = ENV.fetch("VAGRANT_MEMORY", "2048")
  end

  config.vm.provision :shell, :path => "./install/install.sh", :args => home_dir
end
