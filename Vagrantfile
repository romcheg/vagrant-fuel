ENV["VAGRANT_DEFAULT_PROVIDER"] = "xhyve"


Vagrant.configure("2") do |config|
    config.vm.define "fuel-dev" do |fuel_dev|

        fuel_dev.vm.box = "xhyve-debian-8.5.0-amd64"
        fuel_dev.vm.synced_folder "../../projects/mos/fuel-web", "/home/vagrant/fuel-web"
        fuel_dev.vm.synced_folder "../../projects/mos/python-fuelclient", "/home/vagrant/python-fuelclient"

        fuel_dev.vm.provider :xhyve do |xhyve|
            xhyve.cpus = 2
            xhyve.memory = "1G"
        end

        fuel_dev.vm.provision "shell", path: "provision.sh"
    end

end
