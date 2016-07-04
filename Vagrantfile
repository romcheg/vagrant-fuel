ENV["VAGRANT_DEFAULT_PROVIDER"] = "xhyve"

rsync_exclude = [".git/", ".tox/", ".eggs/", ".vagrant/", "*.pyc"]

Vagrant.configure("2") do |config|
    config.vm.define "fuel-dev" do |fuel_dev|

        fuel_dev.vm.box = "xhyve-debian-8.5.0-amd64"
        fuel_dev.vm.synced_folder "../../projects/mos/fuel-web", "/home/vagrant/fuel-web", rsync__exclude: rsync_exclude
        fuel_dev.vm.synced_folder "../../projects/mos/python-fuelclient", "/home/vagrant/python-fuelclient", rsync__exclude: rsync_exclude

        fuel_dev.vm.provider :xhyve do |xhyve|
            xhyve.cpus = 2
            xhyve.memory = "1G"
        end

        fuel_dev.vm.provision "file", source: "~/.config/git/ignore", destination: "~/.config/git/ignore"
        fuel_dev.vm.provision "shell", path: "provision.sh"
    end

end
