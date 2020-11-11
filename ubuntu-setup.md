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

This file seems to take precedence over `/etc/hosts` when there is a conflict.

### Create and trade SSH keys
1. If you don't have a key already:
	```
	ssh-keygen
	```
2. Copy your public key to the host's `authorized_keys`
	```
	cat ~/.ssh/id_rsa.pub | ssh USER@HOST "cat >> ~/.ssh/authorized_keys"

	or

	ssh-copy-id USER@HOST
	```

### Update host aliases
1. Edit `/etc/hosts` (as root), adding `ip name` for each entry:
	```
	66.90.115.178 mycomputer
	```

### Move SSH server to another port (later idea)
https://thepcspy.com/read/making-ssh-secure/

## Software

### Vim
1. add the backport PPA
	```
	sudo add-apt-repository ppa:jonathonf/vim
	```
2. upgrade/install
	```
	sudo apt update
	sudo apt install vim
	```
3. Install NeoVimBundle
	```
	curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
	sh ./install.sh
	```

	If this requires root, and the files end up owned by root, you must `chown` them again before NeoVim can be fully installed. Then launch `vim` and run `:NeoBundleInstall`

### Git
```
sudo apt-get install vim
```

### Zsh
https://linuxhint.com/install_zsh_shell_ubuntu_1804/

1. Install and set as default login shell
	```
	sudo apt-get install zsh
	sudo usermod -s /usr/bin/zsh $(whoami)
	sudo reboot
	```
2. Install ohmyzsh
	```
	sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	```
3. Install powerline fonts and Powerlevel9k theme:
	```
	sudo apt-get install powerline fonts-powerline
	sudo apt-get install zsh-theme-powerlevel9k  # if that does work, try next
	```

	```
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
	```

	Then select theme in `~/.zshrc`:
	```
	ZSH_THEME="powerlevel9k/powerlevel9k"
	```

## VNC
1. Install RealVNC Server from realvnc.com (or from the Ubuntu software center: `realvnc-vnc-server`)
2. Run it, login with RealVNC account, adding the computer to my team

## Truecrypt
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

# RPI Setup
(in no particular order right now)

## Security
https://www.raspberrypi.org/documentation/configuration/security.md

1. change username
2. set password
3. cron job to keep SSH up to date
4. firewall

## Start to finish home media server in docker
https://www.smarthomebeginner.com/docker-home-media-server-2018-basic/

## Docker and docker-compose
https://dev.to/rohansawant/installing-docker-and-docker-compose-on-the-raspberry-pi-in-5-simple-steps-3mgl

## Run PiHole!
* it's a network-level ad bocker
