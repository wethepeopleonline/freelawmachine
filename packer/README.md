Free Law (Virtual) Machine
==========================

For those interested in building their own version of the Vagrant box, the
following instructions detail how to use Packer and the accompanying scripts.

## Requirements
* [Vagrant 1.7.4](https://www.vagrantup.com)
* [Packer 0.8.6](https://packer.io/downloads.html)
* [Virtualbox 5.x](https://www.virtualbox.org/)
* Git

And a high-speed network connection since the VM will need to pull down
packages! (You are installing Ubuntu...so do this via a cellular data connection
at your own $$ peril!)

## Usage
Here's how to crank out a box if you've got the Requirements above.

0. Grab the latest:
`git clone https://github.com/voutilad/freelawmachine ; cd freelawmachine`

1. Get packing:
`packer build flm-packer.json`

2. Install the Vagrant box locally
`vagrant box add packer_virtualbox-iso_virtualbox.box --name freelaw/trusty32-devbox`

3. Initialize a Vagrantfile
`vagrant init freelaw/trusty32-devbox`

4. Grab CourtListener (opinion-split branch)
`git clone -b opinion-split https://github.com/freelawproject/courtlistener.git`

5. Vagrant up!
`vagrant up`

6. Connect to the Vagrant box
`vagrant ssh`

7. Start CourtListener (from wit)
``` bash
cd /var/www/courtlistener
./manage.py runserver 0.0.0.0:8000
```

8. Fire up your browser (on your local machine)!
[http://localhost:8000](http://localhost:8000)

## Development Tips
If you're playing around, here are some things to remember:
* Vagrant installs boxes typically in your home directory under something like
`.vagrant.d`. Make sure you use the same box name when using `vagrant box add`
and it will replace that existing box. (You probably need to add `--force` or
  something to the command, btw.)
* Vagrant keeps instances of vm's in the local directory where your Vagrantfile
is and where you are running `vagrant up`. Do a simple `vagrant destroy` to
wipe it out when you've built a new box version and want to start over.


## Various Details
* Based on Ubuntu Server 32-bit (for now) 14.04 LTS
* Trying to target dev machines that have:
  * 8 GB RAM
  * [Virtualbox 5.x](https://www.virtualbox.org/)
  * Lack of VT-X support (hence 32-bit VM is the initial goal)

## Possible Future Goals
* VMWare support
* 64-bit support
* Prod machine box generation???

## Some References
[A packer template for Vagrant from Hashicorp](https://github.com/hashicorp/atlas-packer-vagrant-tutorial.git)