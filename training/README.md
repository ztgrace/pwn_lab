# PWN Lab Training

PWN Lab training environment is a collection of VMs to hone your hacking skills, test your tools and perform demos.

## Virtual Machines

To bring up the entire environment, run `vagrant up`. To start a single VM use the `vagrant up` command with a machine name such as, `vagrant up metasploitable2`. The following VMs are 

* [Kali Linux](https://www.kali.org/) 1.1.0a (kali_mini) - A minimal installation of Kali where the only tools installed are metasploit-framework, nmap, hydra, john and sqlmap. Use `apt-get install` to install additional packages. 
* [Metasploitable 2](http://sourceforge.net/projects/metasploitable/files/Metasploitable2/) (metasploitable2) - An intentionally vulnerable Linux VM used to practice penetration testing techniques and test security tools.
* [OWASP Broken Web Apps v1.2.rc1](https://www.owasp.org/index.php/OWASP_Broken_Web_Applications_Project) (owaspbwa) - OWASP Broken Web Apps is collection of vulnerable web applications.

## Network

Each of the VMs in this environment are configured with a private_network adapter on the 172.16.31.0/24 network so they can communicate to each other. If this network conflicts with one of your networks, you can change that by modifying the `base_network` variable in the `Vagrantfile`. 

* kali_mini - 172.16.31.10
* metasploitable2 - 172.16.31.100
* owaspbwa - 172.16.31.101

## SSH Access

You can log into a VM by using the `vagrant ssh` command like the example below.

    # vagrant ssh kali_mini
    Linux kali-mini 3.18.0-kali3-amd64 #1 SMP Debian 3.18.6-1~kali2 (2015-03-02) x86_64
    
    The programs included with the Kali GNU/Linux system are free software;
    the exact distribution terms for each program are described in the
    individual files in /usr/share/doc/*/copyright.
    
    Kali GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
    permitted by applicable law.
    Last login: Tue Jun 30 23:34:26 2015 from 10.0.2.2
    $ id
    uid=1000(vagrant) gid=1000(vagrant) groups=1000(vagrant)
    $ sudo bash
    root@kali-mini:/home/vagrant#
