## Fedora 37 KDE Minimal Install
A guide to install Fedora Linux with the KDE Plasma Desktop Environment (DE) from a minimal Fedora installation. This will allow better control over which packages are included in Fedora KDE and result in a cleaner, lighter Fedora installation than the official Fedora KDE spin offers. The guide will provide step-by-step instructions to accomplish installing the KDE DE on top of a minimal Fedora install. I will also include optional, simple scripts to help with the process of installing the required packages to setup KDE on a minimal Fedora installation.

I set out to do this as I found the official Fedora KDE spin to be bloated. I found out I was not the only person who felt this way as I found plenty of evidence online of others who felt the same about Fedora's official KDE spin. The issue is that the Fedora KDE spin includes many programs and packages that the majority of people do not want or use. From another perspective, people would rather have the option to install the software packages versus having them installed without choice. In my research I did not find any answers that satisfied my desire for a clean, light Fedora KDE installation. Most people seemed to be taking Workstation and slapping KDE on top of it or taking the KDE spin and trying to uninstall stuff in a painstaking manner.

Just to be clear, this isnt an extreme take on minimalism. I am positive there are packages that can be excluded from my guide and have a machine still work. My real goal here is to avoid the trove of KDE applications included in the Fedora KDE spin and avoid having multiple packages for the same thing (like 3 text editors, 2 software centers, etc.). Ideally, I want Fedora KDE with a select few KDE applications.

**Warning:**
I will assume for the rest of this guide that Fedora Linux will be installed on a physical machine as the only OS. Be sure that if the computer was previously used, that all files and information needed has been backed up externally. If you elect to follow these directions you do so at your own risk and assume full responsibility for the outcome. It is up to you to determine if your computer is compatible with Fedora and to; properly plan for, prepare for, execute, configure post install and troubleshoot attempting to follow this guide.

I am posting this as personal reference but also for others benefit in case they are also interesting in a more minimal Fedora KDE setup.

## Resources for Installing Fedora KDE Minimally
* Fedora Everything ISO can be downloaded from https://alt.fedoraproject.org/. This is basically what some may call a net install ISO.
* Github repo [Fedora KDE Minimal Install](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide)

## Requirements for Fedora KDE Minimal
* Fedora Everything ISO. Made bootable via a physical disc, USB drive or via PXE. Official documentation on [Preparing Boot Media](https://docs.fedoraproject.org/en-US/fedora/latest/preparing-boot-media/#sect-preparing-obtaining-images)
* Internet connection. The ISO above included only the packages required to run the installer. All selected packages are downloaded over the internet to install. Post minimal install, internet will be required to add the packages we need.
* If using Wifi (see the [Wifi Networking](https://github.com/nenadsky/linux-install/tree/main/fedora#wifi-networking-support) portion of this guide):
  * Know what make and chipset you are using.
  * Have an external drive or USB stick handy.
  * Place the required packages for Wiki and your Wifi card on the externla media.
* Willingness to use the terminal to setup and configure some packages and settings.
* Willingness to troubleshoot and work out problems you may encounter specific to your unique setup/machine/environment.

## 1. Install Fedora 37 Minimal 
In this part of the guide we are installing Fedora minimal from the boot media created as listed in the above requirements. Instead of re-writing what has already been documented, I will outline the process and provide links to official documenation. Take some liberties with your own setup depending on your wants and needs.

1. Boot from the installation media. [Booting the Installation](https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/install/Booting_the_Installation/). Here you select the option to install Fedora
2. Follow Fedora's installer GUI called Anaconda, which should load up after selecting to install Fedora from the previous step (this may take several minutes). A generalized guide from the official documentation [Installing in the Grpahic User Interface](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/).
3. Select your language.

The [Installation Summary](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-installation-summary) screen in Anaconda acts as a portal to all of the choices we need to make. Some portions of this screen take longer to load than other. What order we pick or settings in does not matter. Below I will list them in the order I typically find the options load in.

1. Localization heading. Adjust the options here as needed to match your date & timezone, language and keyboard setup. It is possible for some people that no changes will need to be made here.
2. [Installation Destination](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-storage-partitioning). It is from this section that you can partition your drive(s), set file systems, etc. If you are unsure what to select, Automatic configuration is likely the best option. If you know what you are doing and want to partition your drive a certina way, select "I will configure partitioning". Optionally, you can check the "Encrypt my data" checkbox if you want to use disk encryption. Press the "Done" button at the top left when finished.
3. [Network & Hostname](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-network-configuration). From here set at least one network connection up and have it be active. It is possible that one or more connections may already be connected and active. You could set the IP statically or via DHCP. Optionally, you may chose to set the hostname of the computer at this time as well. Press the "Done" button at the top left when finished.
  * **NOTE:** If using Wifi AND a hidden SSID you may run into trouble connecting as Anaconda may not have an option to select hidden Wifi networks. If this is the case, there are 2 options to connnect to your wifi. A) Temporarily set the SSID visible, B) Pick any visible Wifi connection with some sort of protection enabled (IE: not an open network). Press "Cancel" on the password dialog. Click the "Configure" button at the bottom right. Change the name to your Wifi's hidden SSID, the password field to your Wifi password and all other settings according to those matching your Wifi network. Press "Ok". If it does not appear to work (sometimes the first attempt does not), try toggling the "switch" at the top to disable and enable Wifi. If this does not work redo the steps again but use another visible Wifi network. When it works, your SSID will be listed along with its status.
4. [Software Selection](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-software-selection). After the "Installation Source" loads, which may take a minute, this option is used to determine what to initially install. Select "Minimal Install" on the left hand side and nothing on the right hand side. Press the "Done" button at the top left when finished.
5. Click the "Begin Installation" button at the bottom right of the "Installation Summary" screen to start the install.
6. Set the password for the root user. I recommend using something strong and unique.
7. [Create a user](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-create-user). This will be the user you will typically login as and use the computer as. If want this user to have sudo, check the box for "Make this user administrator". Set the password, again I recommend something strong and unique.

Progress will be shown on screen and when complete the computer will reboot and load to a text/shell login asking for username and password. I recommend using the user creation from step 7 above, assuming they had been given admin rights (sudo). You can instead use root credentials to login.

## 2. Installing KDE Plasma Desktop Environtment

### Wifi Networking Support
Since this guide is intended for desktop installation, the packages listed in this section are necessary to enable the use of the Wi-Fi module. So this step is not necessary. 

* NetworkManager-wifi
* wpa_supplicant
* wireless-tools
* crda
* iw
* Wifi firmware package(s). 

To connect to a wifi network see the following link to [Configure Wifi Connections](https://fedoraproject.org/wiki/Networking/CLI). Once connected to your wifi proceed with installing the packages for KDE in the next steps.

Alternatively, if you have a wired NIC as well (even a USB to NIC adapter) then you can very likely complete the full guide/install and after KDE is installed, wifi may simply "just work".

From here on in this guide I will assume that a given machine has a working internet connection.

### Required Packages
The following packages can be installed issuing a single comand of:

```Bash
dnf install xorg-x11-server-Xorg xorg-x11-drv-amdgpu xorg-x11-drv-fbdev xorg-x11-drv-evdev sddm plasma-desktop plasma-discover plasma-systemmonitor sddm-kcm kde-partitionmanager cups kde-print-manager dolphin konsole5 okular gwenview spectacle kate ark kcalc firefox fuse bash-completion htop neofetch
```

Then we need to enable sddm and set the graphical.target as the default as follows (each line is a seperate command):

```Bash
sudo systemctl enable sddm
sudo systemctl set-default graphical.target
reboot
```

This should reboot and load the SDDM graphical screen for logging in, then load to KDE plasma 5 DE.

### Other Packages

#### Enable RPM Fusion repository
For detailed instructions and HowTos visit [RPM Fusion site](https://rpmfusion.org)

Open terminal and paste this:
```Bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

#### Enable Flatpaks and Flathub repo
Flatpaks are slowly becoming a standard in application distribution. To enable Flathub repository and later on install apps using Discover App, type this in Konsole. 
```Bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

## Shell Script to Install Required Packages (Optional)
The `fedora-minimal.sh` script in this repo can be used to install all of the required packages (does not include recommended or optional). You may execute the script as is or add your desired packages (or remove ones) to the script. The script simply checks it was run as sudo or root and then executes the `dnf install package1 package2` command from the "Required Packages" section of this guide above so you do not have to manually type all the packages to install. It does nothing else.

To execute the script (assuming your are in the your home directory:

```Bash
sudo chmod +x fedora-minimal-plasma.sh
sudo ./fedora-minimal-plasma.sh
```

This will install the packages, you will still need to execute the commands to enable SDDM, set the graphical.target and reboot. Those steps are detailed above in the [Installing KDE Plasma Desktop Environtment](https://github.com/nenadsky/linux-install/tree/main/fedora#installing-kde-plasma-desktop-environment) section of this guide. You can also add to or extend the script to install other desired packages, include/automate additonal commands, etc.

**Helpful Commands**
* `dnf grouplist` (Lists all available groups to install)
* `dnf groupinfo "group name"` (Lists all the packages and groups contained within a group. Replace `group name` with the actual group name)
* `dnf search keyword` (Replace `keyword` with the package name, word or short phrase to search for. This is used to find packages in `dnf`)
* `df -h` (Lists all file systems)
* `dnf erase <pkg_name> --noautoremove` (Remove single package without removing its dependencies)

## Final Thoughts
This guide should provide a solid foundation for a lean, minimalistic Fedora KDE install. This guide can also be called installing Fedora the Arch way :) BIG thanks to [Zer0CoolX](https://github.com/Zer0CoolX) for his work. His [repo and script](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide) are the foundation for mine adjustments to the script.
