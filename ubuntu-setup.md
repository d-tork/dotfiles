# Ubuntu setup

## Allow for SSH
1. install openssh
	```
	sudo apt install openssh-server
	```
2. get IP address
	```
	ip addr show
	```
3. connect on other machine
	```
	ssh user@ipaddress:port
	```

### Create SSH config file
In `~/.ssh/config`, add each host:

```
Host your_alias_name
	User username
	HostName remote.sshserver.com
	Port 50001  				# optional; it's usually 22
	IdentityFile ~/.ssh/id_rsa  # optional
	ServerAliveInterval 120		# refresh every 2 min
	ServerAliveCountMax 30		# stop refreshing after 1 hr
```

### Create and trade SSH keys
1. If you don't have a key already:
	```
	ssh-keygen
	```
2. Copy your public key to the host's `authorized_keys`
	```
	cat ~/.ssh/id_rsa.pub | ssh USER@HOST "cat >> ~/.ssh/authorized_keys"
	```

### Update host aliases
1. Edit `/etc/hosts` (as root), adding `ip name` for each entry:
	```
	66.90.115.178 mycomputer
	```

### Move SSH server to another port
https://thepcspy.com/read/making-ssh-secure/

## Install and upgrade Vim
1. add the backport PPA
	```
	sudo add-apt-repository ppa:jonathonf/vim
	```
2. upgrade/install
	```
	sudo apt update
	sudo apt install vim
	```

## VNC Setup
1. Install RealVNC Server from realvnc.com
2. Run it, login with RealVNC account, adding the computer to my team

## Install Truecrypt
https://www.configserverfirewall.com/ubuntu-linux/install-truecrypt-ubuntu/

```
sudo add-apt-repository ppa:stefansundin/truecrypt
sudo apt-get update
sudo apt-get install truecrypt
sudo visudo -f /etc/sudoers.d/truecrypt
```

Add the following line to the file: 
```
your_username ALL=(ALL) NOPASSWD:/usr/bin/truecrypt
```
where `your_username` is your Linux username

## Configuring GRUB (like for low-graphics-mode)
* https://www.howtogeek.com/196655/how-to-configure-the-grub2-boot-loaders-settings/
* https://askubuntu.com/questions/19486/how-do-i-add-a-kernel-boot-parameter/19487#19487
* https://askubuntu.com/questions/63264/unsupported-video-chipset-how-do-i-force-low-graphics-mode

## SE question for solving corrupted MacOS recovery
* [screenshot to use](https://askubuntu.com/questions/219514/where-to-install-bootloader-when-installing-ubuntu-as-secondary-os)
* [EFI fallback resources](https://www.rodsbooks.com/efi-bootloaders/fallback.html)
