# Work Environment Configuration
This repo contains scripts and other configuration information to setup my preferred working
environment.


## Scripts
Prerequisites: install bash, git, vim, and tmux

Order to Run:
*   setup_git.sh: configures certain git settings; assumes git is installed
*   setup_dotfiles.sh: links configuration dotfiles (such as .vimrc and .tmux.conf) to the dotfiles
    in this repo
*   setup_vim.sh: installs Vundle and other plugins for Vim as well as installing needed packages
    (must be run after setup_dotfiles.sh)


## Buildroot Configuration
Add `BR2_DL_DIR=~/buildroot_dl` to `~/.bashrc` to have all buildroot downloads stored in `~/buildroot_dl`.


## Ubuntu Configuration

### set bash as default shell
```
~$ sudo apt install bash
~$ sudo chsh -s /bin/bash [username]
~$ sudo dpkg-reconfigure dash
   # Use arrow key to select "<No>" for "Use dash as the default system shell (/bin/sh)?" and press enter
   # logout and back in to take effect
```

### no sudo for dmesg
Sudo for dmesg was required beginning around 22.04 or so.

To remove this: `echo kernel.dmesg_restrict=0 | sudo tee -a /etc/sysctl.d/99-dmesg.conf`


## Git Configuration

### Git LFS Timeouts
If using Git LFS to store binaries and you get i/o timeouts, this might help:

```
~$ sudo apt install git-lfs     # OK, this should have already been installed...
~$ git config --global lfs.contenttype 0
~$ git config --global lfs.[giturl]/info/lfs.locksverify false
   # example: lfs.https://section.site.com/path/repo_name.git/info/lfs.locksverify
~$ git config --global lfs.dialtimeout 120
~$ git config --global lfs.activitytimeout 120
```


## Minicom Configuration

### no sudo
`sudo adduser [username] dialout` and log out and in to add yourself to the dialout group

### Save config
*   `sudo minicom -s`
*   Configure as desired
*   Choose "Save setup as..", enter name, hit enter. Exit Minicom.
*   Settings should now be saved in /etc/minicom/minirc.[name]
*   Can now launch minicom with `minicom [name]` (assumes user is part of dialout group)


## VMware Configuration

### VMware Shared Folder (Windows Host, Ubuntu Guest)
*   Click "VM -> Settings..."
*   Click "Options" tab
*   Click "Shared Folders"
    *   Under "Folder sharing" on right click "Always enabled"
    *   Under "Folders" click "Add..." and a wizard opens
        *   Click "Next >"
        *   Host path: browse to a folder you want to use as the shared folder (example: C:\work\vm\shared)
        *   Name: shared (or whatever you want to call it)
        *   Click "Next >"
        *   Click "Finish"
*   Click "OK" to close "Virtual Machine Settings"
*   Boot the VM and login
*   Open a terminal and run these commands:
    *   mkdir ~/shares
    *   sudo gedit /etc/systemd/system/home-[username]-shares.mount
        *   This file MUST be named with the folder name path of where the shared folder will be mounted
        *   Put the following into the file (modify "Where=" to match your folder path):

```
[Unit]
Description=Mount VMware Shared Folder
DefaultDependencies=no
Before=umount.target
ConditionVirtualization=vmware
After=sys-fs-fuse-connections.mount

[Mount]
What=vmhgfs-fuse
Where=/home/[username]/shares
Type=fuse
Options=default_permissions,allow_other,max_write=61440

[Install]
WantedBy=multi-user.target
```

        *   IMPORTANT: on 20.04 I needed max_write=61440, but on 22.04 the option is not recognized and must be removed
        *   Save and close the file
*   (back in the terminal):
    *   sudo systemctl enable home-[username]-shares.mount
*   Reboot the VM and login
*   If everything was successful, you should now see ~/shares/shared in Ubuntu

### Ubuntu 22.04 Guest VM Multi-Monitor
When I had Ubuntu 22.04 as a guest VM in VMware, for multi-monitor to work I had to:

*   `sudo nano /etc/gdm3/custom.conf`
*   Uncomment line `#WaylandEnable=false`

### "Bridged" Network Connection Fails
If the bridged network connection starts failing:

*   In VMware, go to "Edit -> Virtual Network Editor"
    *   "Automatic Settings" next to "Bridged" radio button
    *   Try unselecting all except your real physical Ethernet and/or Wifi interfaces

An example was on a work laptop where sometimes a VPN virtual Ethernet adapter was in the list and
caused problems.

### Don't reserve hard drive space for VM's RAM
In your VM's .vmx file, put the following:

```
prefvmx.minVmMemPct = "100"
MemTrimRate = "0"
mainMem.useNamedFile = "FALSE"
sched.mem.pshare.enable = "FALSE"
prefvmx.useRecommendedLockedMemSize = "TRUE"
```

See https://communities.vmware.com/t5/VMware-Workstation-Pro/vmem-files-thrashing-my-HDD/td-p/1361985


## Docker Configuration

### Installation on Ubuntu
Make sure you trust the gpg file these commands grab...

```
~$ sudo apt update
~$ sudo apt install ca-certificates curl gnupg lsb-release
~$ sudo mkdir -p /etc/apt/keyrings
~$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
~$ echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
~$ sudo apt update
~$ sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

### Run docker without sudo
`sudo usermod -aG docker [username]`

**Security Warning:** Docker issues the following warning:

> The `docker` group grants root-level privileges to the user. For details on how this impacts
> security in your system, see
> [Docker Daemon Attack Surface](https://docs.docker.com/engine/security/#docker-daemon-attack-surface).

### Change docker logging
Create or edit (with sudo) /etc/docker/daemon.json:

```
{
    "log-driver": "local",
    "log-opts": {
        "max-size": "20m",
        "max-file": "10"
    }
}
```

See [Configure logging drivers](https://docs.docker.com/config/containers/logging/configure/) for
more information. It is recommended to use the "local" logging driver.
