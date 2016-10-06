# -*- mode: ruby -*-
# vi: set f=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "chad-thompson/ubuntu-trusty64-gui"
    config.vm.synced_folder "shared", "/tmp/shared"

    config.vm.provider :virtualbox do |vbox|
        vbox.gui = true
        vbox.memory = 4096
        vbox.cpus = 2
    end

    config.vm.define "master" do |master|
        master.hostname = "vumaster.qac.local"
        master.network :public_network, ip: "192.168.1.20"
        master.provision :shell, path: "bootstrap_master.sh"

        master.vm.provider :virtualbox do |vbox|
            vbox.name = "VUMaster"
        end
    end

    config.vm.define "agent1" do |agent1|
        agent1.hostname = "vuagent1.qac.local"
        agent1.network :public_network, ip: "192.168.1.21"
        agent1.provision :shell, path: "bootstrap_agent.sh"

        agent1.vm.provider :virtualbox do |vbox|
            vbox.name = "Vagrant Up Agent 1"
        end
    end

    config.vm.define "agent2" do |agent2|
        agent2.hostname = "vuagent2.qac.local"
        agent2.network :public_network, ip: "192.168.1.22"
        agent2.provision :shell, path: "bootstrap_agent.sh"

        agent2.vm.provider :virtualbox do |vbox|
            vbox.name = "VUAgent2"
        end
    end

    config.vm.define "agent3" do |agent3|
        agent3.hostname = "vuagent3.qac.local"
        agent3.network :public_network, ip: "192.168.1.23"
        agent3.provision :shell, path: "bootstrap_agent.sh"

        agent3.vm.provider :virtualbox do |vbox|
            vbox.name = "VUAgent3"
        end
    end

end
