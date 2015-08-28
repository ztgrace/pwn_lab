#PWN Lab

PWN Lab is a collection of Vagrant scripts and boxes to create security training environments. Getting a running environment is as easy as cloning the repository and running `vagrant up`.

## Environments

* **Training** - The PWN Lab training environment is a collection of VMs to hone your hacking skills, test your tools and perform demos.
* **X11** - This VM has a poorly configured X11 server. This replicates poor configurations I've seen on past engagements.

## Prerequisites

In order to use PWN Lab, you'll need to install the following software packages.

1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - VirtualBox is a cross-platform virtualization product.
2. [Vagrant](https://www.vagrantup.com/) - Vagrant is a tool for building virtualized environments.
3. [Ansible](http://www.ansible.com/home) - Ansible is used as a provisioner for Vagrant. It performs post-VM creation tasks such as updating to the latest software release.
4. [Git](https://git-scm.com/) - Git is a distributed version control system.

## Installation

1. Clone the pwn_lab training environment `git clone https://github.com/ztgrace/pwn_lab`
2. Change directory into an environment `cd training`
3. Issue the appropriate vagrant commands to instantiate the environment such as `vagrant up`
4. See additional instructions in each environment's README.md
