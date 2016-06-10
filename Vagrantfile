# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  # setup the shared folder
  home_dir = "/home/vagrant"
  config.vm.synced_folder ".", home_dir + "/loris"

  # forward port 5004 for loris
  config.vm.network :forwarded_port, guest: 5004, host: 5004

  # default to 2gb of memory, but allow overrides
  config.vm.provider "virtualbox" do |v|
    v.memory = ENV.fetch("VAGRANT_MEMORY", "2048")
  end

  # setup script
  config.vm.provision :shell, :path => "./install/install.sh", :args => home_dir
end
