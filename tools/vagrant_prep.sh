#!/bin/bash
# pwn_lab/tools/vagrant_prep.sh
# Copyright (C) 2015 Zach Grace (ztgrace)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# See <http://www.gnu.org/licenses/> for a copy of the GNU General
# Public License

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

unset HISTFILE

if [ -d /etc/sudoers.d ]; then
    #visudo -f /etc/sudoers.d/vagrant
    echo "vagrant ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/vagrant
else
    #visudo -f /etc/sudoers
    echo "vagrant ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
fi

# Install default vagrant ssh key
useradd -m vagrant
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
wget --no-check-certificate \
    https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
    -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# TODO: use sed command to fix outdated repos
#res=$(apt-get update)
#if
#apt-get install ssh

# Configure ssh server
if [ $(grep -c "^AuthorizedKeysFile\s\+%h/.ssh/authorized_keys$" /etc/ssh/sshd_config) -eq 0 ]; then
    echo "AuthorizedKeysFile %h/.ssh/authorized_keys" >> /etc/ssh/sshd_config
fi

# Enable ssh
update-rc.d ssh enable 2 3 4 5
insserv ssh

# Install headers
apt-get install -y gcc build-essential linux-headers-$(uname -r)

# Mount the Guest Additions
read -n1 -r -p "Insert Guest Additions CD Image, then press any key to continue..." key
mount /dev/sr0 /mnt
cd /mnt
./VBoxLinuxAdditions.run
cd -
umount /mnt

# Remove downloaded packages
rm /var/cache/apt/archives/*.deb

# Zero out the file system
dd if=/dev/zero of=/ZERO bs=1M
rm -f /ZERO

echo "Don't forget to delete $0!"
