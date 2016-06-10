## loris vagrant

this vagrant vm is provided to quickly setup a [loris imageserver](http://github.com/loris-imageserver/loris/).

## requirements

* [vagrant](https://www.vagrantup.com/)
* [virtualbox](https://www.virtualbox.org/)

## setup

1. clone this repository with `git clone https://github.com/escowles/loris-vagrant.git` or [download a zip file from github](https://github.com/escowles/loris-vagrant/archive/master.zip).
2. `cd loris-vagrant`
3. `vagrant up`

once the vagrant machine is started, loris will be at [http://localhost:5004/loris/](http://localhost:5004/loris/], serving files placed in the `loris-vagrant/images/` directory.

you can shell into the machine with `vagrant ssh` or `ssh -p 2222 vagrant@localhost`
