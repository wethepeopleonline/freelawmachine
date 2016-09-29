# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "freelawproject/freelawbox64"

  # Forwarding for CourtListener
  config.vm.network "forwarded_port", guest: 8000, host: 8888
  # Forarding for Solr
  config.vm.network "forwarded_port", guest: 8983, host: 8999

  # Sync our local courtlistener directory to the one inside our vagrant box
#  if !File.directory?(File.expand_path("./courtlistener"))
#    config.vm.provision "shell", inline: "rm -Rf /var/www/courtlistener"
#  end
  config.vm.synced_folder "./courtlistener", "/var/www/courtlistener", create: true

  config.vm.provider "virtualbox" do |vb, override|
    vb.gui = false
    vb.memory = "2048"
  end

	# Use Ansible to set up CourtListener
  config.vm.provision :ansible_local do |ansible|
    ansible.provisioning_path = "/vagrant/ansible"
    ansible.playbook = "freelawbox.yml"
    ansible.limit = "all"
    ansible.inventory_path = "/vagrant/ansible/config/hosts_local"
  end
end
