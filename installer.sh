#!/bin/bash


# ================================= CONFIG =========================================

# MODE=d

# CONFIRM_ALL=true

# REDOWNLOAD_IF_EXIST=true
# SKIP_ADD_REPOS=true
# SKIP_DOWNLOAD_APT=true
# SKIP_DOWNLOAD_DOWNLOAD_DEB=true
# SKIP_DOWNLOAD_APPIMAGE=true
# SKIP_DOWNLOAD_BUNDLE=true
# SKIP_DOWNLOAD_BIN=true
# SKIP_DOWNLOAD_INSTALLER
# SKIP_DOWNLOAD_LIBS=true

# REINSTALL=true
# SKIP_INSTALL_APT=true
# SKIP_INSTALL_DOWNLOAD_DEB=true
# SKIP_INSTALL_APPIMAGE=true
# SKIP_INSTALL_BUNDLE=true
# SKIP_INSTALL_BIN=true
# SKIP_INSTALL_INSTALLER
# SKIP_INSTALL_LIBS=true


soft=(
    # apps that ask confirm
    "Internet / Browser | opera-stable | apt"
    "Audio / Jack | jackd2 | apt" 
    
    "Android | kdeconnect | apt" 
    "Android | scrcpy | apt" 
    "Audio / Editors | audacity | apt" 
    "Audio / Editors | reaper | installer | https://www.reaper.fm/files/6.x/reaper680_linux_x86_64.tar.xz | cd 'reaper_linux_x86_64' && sudo './install-reaper.sh' --install /opt --integrate-desktop" # https://www.reaper.fm/download.php
    "Audio / Editors | saucedacity | AppImage | https://github.com/tenacityteam/saucedacity/releases/download/v1.2.1/saucedacity-1.2.1-linux-x86_64.AppImage" # https://github.com/tenacityteam/saucedacity/releases
    "Audio / Players | quodlibet | apt" 
    "Audio / PulseAudio | pavucontrol | apt" 
    "Audio / TagEditor | exfalso | apt" 
    "Audio / TagEditor | puddletag | apt" 
    "Crypt | keepassxc | apt" 
    "Crypt | veracrypt | deb | https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-Ubuntu-22.04-amd64.deb" # https://www.veracrypt.fr/en/Downloads.html
    "Crypt | veracrypt-console | deb | https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-console-1.25.9-Ubuntu-22.04-amd64.deb" # https://www.veracrypt.fr/en/Downloads.html
    "Dev / 3D | blender | apt" 
    "Dev / C++ | cmake | apt" 
    "Dev / C++ | g++ | apt" 
    "Dev / C++ | ninja-build  | apt" 
    "Dev / DB | sqlitebrowser | apt" 
    "Dev / Diff | meld | apt" 
    "Dev / Git | git | apt" 
    "Dev / Git | GitFiend | deb | https://gitfiend.com/resources/GitFiend_0.42.0_amd64.deb" # https://gitfiend.com/all-downloads
    "Dev / Git | github-desktop | apt" 
    "Dev / Git | gitkraken | deb | https://release.gitkraken.com/linux/gitkraken-amd64.deb" 
    "Dev / Git | Glint | AppImage | https://github.com/LogicOverSnacks/glint-release/releases/download/v1.4.1/Glint-1.4.1.AppImage" 
    "Dev / Git | SmartGit | deb | https://www.syntevo.com/downloads/smartgit/smartgit-22_1_5.deb" # https://www.syntevo.com/smartgit/download/
    "Dev / Git | sublime-merge | apt" 
    "Dev / GTK | glade | apt" 
    "Dev / Jetbrains | CLion | bin | https://download-cdn.jetbrains.com/cpp/CLion-2023.1.3.tar.gz" # https://www.jetbrains.com/clion/download/#section=linux
    "Dev / Jetbrains | PyCharm | bin | https://download-cdn.jetbrains.com/python/pycharm-community-2023.1.2.tar.gz" # https://www.jetbrains.com/pycharm/download/#section=linux
    "Dev / Jetbrains | Rider | bin | https://download-cdn.jetbrains.com/rider/JetBrains.Rider-2023.1.2.tar.gz" # https://www.jetbrains.com/rider/download/#section=linux
    "Dev / Jetbrains | WebStorm | bin | https://download-cdn.jetbrains.com/webstorm/WebStorm-2023.1.2.tar.gz" # https://www.jetbrains.com/webstorm/download/#section=linux
    "Dev / Node | nodejs  | apt" 
    "Dev / Node | npm  | apt" 
    "Dev / Python | python3-pip | apt" 
    "Dev / Qt | qtcreator | apt" 
    "Dev / REST | httpie  | apt" 
    "Dev / VSCode | apt-transport-https  | apt" 
    "Dev / VSCode | code  | apt" 
    "Disk / Archivers | peazip | deb | https://github.com/peazip/PeaZip/releases/download/9.2.0/peazip_9.2.0.LINUX.GTK2-1_amd64.deb" # https://peazip.github.io/peazip-linux.html 
    "Disk / Archivers | rar | apt" 
    "Disk / Backup | clonezilla | apt" 
    "Disk / Backup | unison-gtk | apt" 
    "Disk / Duplicate-Finder | czkawka  | AppImage | https://github.com/qarmin/czkawka/releases/download/6.0.0/linux_czkawka_gui_alternative.AppImage" # https://github.com/qarmin/czkawka/releases/
    "Disk / Duplicate-Finder | czkawka-cli  | bin | https://github.com/qarmin/czkawka/releases/download/6.0.0/linux_czkawka_cli" # https://github.com/qarmin/czkawka/releases/
    "Disk / Duplicate-Finder | fdupes | apt" 
    "Disk / FileManager | doublecmd-qt | apt"
    "Disk / FileManager | krusader | apt" 
    "Disk / FileManager | nemo-media-columns | apt" 
    "Disk / FileManager | nemo-seahorse | apt" 
    "Disk / Partition | gparted | apt" 
    "Disk / Partition | usb-creator-gtk | apt" 
    "Disk / Search | catfish | apt" 
    "Disk / Search | kfind | apt" 
    "Games | steam:i386 | apt" 
    "Graphics / Editor  | gimp | apt" 
    "Graphics / Editor  | krita | apt" 
    "Graphics / Screenshots | flameshot | apt" 
    "Graphics / Screenshots | shutter | apt" 
    "Graphics / Viewer | gthumb | apt" 
    "Graphics / Viewer | XnViewMP | deb | https://download.xnview.com/XnViewMP-linux-x64.deb"  # https://www.xnview.com/en/xnviewmp/#downloads
    "Hardware / Benchmark | Geekbench5 | bin | https://cdn.geekbench.com/Geekbench-5.5.1-Linux.tar.gz" # https://www.geekbench.com/legacy/
    "Hardware / Benchmark | Geekbench6 | bin | https://cdn.geekbench.com/Geekbench-6.0.3-Linux.tar.gz" # https://www.geekbench.com/download/
    "Hardware / Benchmark | iperf | apt" 
    "Hardware / Benchmark | kdiskmark | apt" 
    "Hardware / Benchmark | mangohud | apt" 
    "Hardware / Benchmark | speedtest-cli | apt" 
    "Hardware / CPU | cpulimit | apt" 
    "Hardware / Display | ddcutil | apt" # cli tool for DDC/CI diplay brightness control (needed for brightness control applets)
    "Hardware / Joystick | jstest-gtk | apt" 
    "Hardware / Monitoring | psensor | apt" 
    "Hardware / Mouse | barrier | apt" 
    "Hardware / Mouse | imwheel | apt" 
    "Hardware / Power | powertop | apt" 
    "Hardware / SSD | nvme-cli | apt" 
    "Internet / Downloader | aria2 | apt" 
    "Internet / Downloader | axel | apt" 
    "Internet / Downloader | uget | apt" 
    "Internet / Downloader | uget-integrator | apt" 
    "Internet / Downloader | yt-dlp | apt" 
    "Internet / Firewall | opensnitch | deb | https://github.com/evilsocket/opensnitch/releases/download/v1.6.0-rc.5/opensnitch_1.6.0-rc.5-1_amd64.deb" # https://github.com/evilsocket/opensnitch/releases
    "Internet / FTP | filezilla | apt" 
    "Internet / Mail | evolution | apt" 
    "Internet / Messenger | Telegram | bin | https://updates.tdesktop.com/tlinux/tsetup.4.8.3.tar.xz" # https://desktop.telegram.org/
    "Internet / Music | spotify-client | apt" 
    "Internet / PortScanner | nmap | apt"     
    "Internet / Remote-Desktop | krdc | apt" 
    "Internet / Remote-Desktop | remmina | apt" 
    "Internet / Remote-Desktop | xrdp | apt" 
    "Internet / Samba | samba | apt" 
    "Internet / Samba | wsdd | apt" 
    "Internet / Terminal | cool-retro-term | apt" 
    "Internet / Terminal | moserial | apt" 
    "Internet / Terminal | putty | apt" 
    "Internet / Torrents | deluge | apt" 
    "Internet / Torrents | qbittorrent | apt" 
    "Internet / Traceroute | traceroute | apt" 
    "Internet / WakeOnLan | gwakeonlan | apt"     
    "System / Automation | d-feet | apt" 
    "System / Automation | dconf-editor | apt" 
    "System / Automation | inotify-tools | apt"     
    "System / Automation | xdotool | apt" 
    "System / Bash-Utils | ccze | apt" 
    "System / Bash-Utils | micro | apt" 
    "System / Bash-Utils | ncdu | apt" 
    "System / Bash-Utils | pv | apt" 
    "System / Bash-Utils | tree | apt" 
    "System / Bash-Utils | xclip | apt" 
    "System / Bash-Utils | xsel | apt" 
    "System / Clean | bleachbit | apt" 
    "System / Launcher | kupfer | apt" 
    "System / Load-Monitoring | btop | apt" 
    "System / Load-Monitoring | htop | apt" 
    "System / Load-Monitoring | iftop | apt" 
    "System / Load-Monitoring | indicator-multiload | apt" 
    "System / Load-Monitoring | nethogs | apt" 
    "System / Load-Monitoring | nvtop | apt" 
    "System / PacketManager | appimagelauncher | apt"
    "System / Text-to-speech | espeak-ng | apt"
    "System / Text-to-speech | festival | apt"
    "System / Utils | gnome-clocks | apt" 
    "Text | obsidian | deb | https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.4/obsidian_1.3.4_amd64.deb" # https://obsidian.md/download
    "Text | sublime-text | apt" 
    "Text | typora | deb | https://download.typora.io/linux/typora_1.6.6_amd64.deb" # https://typora.io/#linux
    "Video / Converter | handbrake | apt" 
    "Video / Editor | kdenlive | apt" 
    "Video / Player | playerctl | apt" # for controlling VLC and other players from cli
    "Video / Player | vlc | apt" 
    "Video / ScreenRecorder | obs-studio | apt" 
    "Video / ScreenRecorder | peek | apt" 
    "Video / ScreenRecorder | simplescreenrecorder | apt" 
    "VM / qemu | bridge-utils | apt"
    "VM / qemu | qemu-kvm | apt"
    "VM / qemu | virt-manager | apt"
    "VM / VirtualBox | virtualbox-guest-additions-iso | apt" 
    "VM / VirtualBox | virtualbox-qt | apt" 
    "VM / VMWare | open-vm-tools-desktop | apt" 
    "VM / VMWare | vmware-workstation | bundle | https://download3.vmware.com/software/WKST-1702-LX/VMware-Workstation-Full-17.0.2-21581411.x86_64.bundle" # https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html
    "VM / wine | lutris | deb | https://github.com/lutris/lutris/releases/download/v0.5.13/lutris_0.5.13_all.deb" # https://github.com/lutris/lutris/releases

    # notebook only
    # "Hardware / Battery | tlpui | apt" 
    # "Hardware / Display | xbacklight | apt" 

    # development
    # "Dev / ReverseEngineering | gameconqueror | apt" 
    # "Dev / ReverseEngineering | wireshark | apt" 
    # "Dev / Docker | docker | apt" 
    # "Dev / Docker | docker-compose | apt" 
    # "Dev / Docker | docker-doc | apt" 
    # "Dev / Docker | docker-registry | apt" 
    # "Dev / Docker | docker.io | apt" 
)

# flatpak offline install is not implemented yet. install apps manually from this list
todo_flatpaks=(
    "Dev / Git | Gittyup | flatpak | com.github.Murmele.Gittyup/x86_64/stable" 
    "VM / wine | ProtonUp-Qt | flatpak | net.davidotek.pupgui2" 
    "Internet / Remote-Desktop | Moonlight-Server | flatpak | dev.lizardbyte.app.Sunshine" 
    "Internet / Remote-Desktop | Moonlight-Client | flatpak | com.moonlight_stream.Moonlight" 
    "Hardware / GPU | GreenWithEnvy | flatpack | com.leinardi.gwe" 
)


# after installing apps offline, run "apt install -f -y" to get the list of required additional libs and put it here
libs=(
    nvidia-driver-525 # nvidia driver
    libcec6 
    libgdk-pixbuf-xlib-2.0-0 
    libgdk-pixbuf2.0-0 
    libnetfilter-queue1
    libp8-platform2
    libsecret-1-dev # for git credential manager
    libgtk-4-dev # for czkawka 
    cabextract # for lutris
    fluid-soundfont-gm # midi sounds
    fluid-soundfont-gs # midi sounds
    python3-html5lib
    python3-genshi
    python-lxml-doc

    libvirt-daemon-system # for qemu
    libvirt-clients       # for qemu

    festvox-ru          # for festival tts
    festvox-us2         # for festival tts
    festvox-us-slt-hts  # for festival tts
)





# to generate this list, use:
# apt update
# apt list --upgradable | awk -F'/' '/^\w/ {print $1}'
# afted downloading, remove cups*, ghostscript* - this packages cous dependencies problems
update=(
# libs
alsa-ucm-conf
apparmor
apt-utils
apt
avahi-autoipd
base-files
bind9-dnsutils
bind9-host
bind9-libs
binutils-common
binutils-x86-64-linux-gnu
binutils
blueman
ca-certificates-java
ca-certificates
casper
cinnamon-common
cinnamon-control-center-data
cinnamon-control-center-dbg
cinnamon-control-center
cinnamon-dbg
cinnamon-desktop-data
cinnamon-screensaver
cinnamon-settings-daemon
cinnamon
curl
distro-info-data
dkms
dnsmasq-base
dpkg-dev
dpkg
firefox-locale-en
firefox
firmware-sof-signed
fonts-noto-color-emoji
fonts-opensymbol
fwupd-signed
fwupd
gir1.2-appstreamglib-1.0
gir1.2-cinnamondesktop-3.0
gir1.2-cvc-1.0
gir1.2-javascriptcoregtk-4.0
gir1.2-meta-muffin-0.0
gir1.2-nemo-3.0
gir1.2-webkit2-4.0
gir1.2-xreader
gir1.2-xviewer-3.0
gnome-screenshot
gnome-session-canberra
gnome-settings-daemon-common
grub-common
grub-efi-amd64-bin
grub-efi-amd64-signed
grub-pc-bin
grub-pc
grub2-common
gstreamer1.0-pipewire
hypnotix
im-config
initramfs-tools-bin
initramfs-tools-core
initramfs-tools
intel-microcode
ipp-usb
iptables
isc-dhcp-client
isc-dhcp-common
kbd
krb5-locales
language-pack-en-base
language-pack-en
language-pack-gnome-en-base
language-pack-gnome-en
less
libappstream-glib8
libapt-pkg6.0
libbinutils
libc-ares2
libcanberra-gtk3-0
libcanberra-gtk3-module
libcanberra-pulse
libcanberra0
libcap2-bin
libcinnamon-control-center1
libcinnamon-desktop-dbg
libcinnamon-desktop4
libcscreensaver0
libctf-nobfd0
libctf0
libcups2
libcupsfilters1
libcupsimage2
libcurl3-gnutls
libcurl4
libcvc-dbg
libcvc0
libdpkg-perl
libfontembed1
libfprint-2-2
libfwupd2
libfwupdplugin5
libglib2.0-data
libgnutls30
libgs9-common
libgs9
libinput-bin
libinput10
libip4tc2
libip6tc2
libjavascriptcoregtk-4.0-18
libkpathsea6
libksba8
libldap-2.5-0
liblibreoffice-java
liblouis-data
liblouis20
libmbim-glib4
libmbim-proxy
libmetacity3
libmm-glib0
libmuffin0
libnautilus-extension1a
libnemo-extension1
libnetplan0
libnss-myhostname
libnss3
libnvpair3linux
libpam-cap
libpam-modules-bin
libpam-modules
libpam-runtime
libpam0g
libperl5.34
libpipewire-0.3-0
libpipewire-0.3-modules
libprotobuf23
libqmi-glib5
libqmi-proxy
libraw20
libreoffice-base-core
libreoffice-base-drivers
libreoffice-base
libreoffice-calc
libreoffice-common
libreoffice-core
libreoffice-draw
libreoffice-gnome
libreoffice-gtk3
libreoffice-help-common
libreoffice-help-de
libreoffice-help-en-gb
libreoffice-help-en-us
libreoffice-help-es
libreoffice-help-fr
libreoffice-help-it
libreoffice-help-pt-br
libreoffice-help-pt
libreoffice-help-ru
libreoffice-help-zh-cn
libreoffice-help-zh-tw
libreoffice-impress
libreoffice-java-common
libreoffice-l10n-de
libreoffice-l10n-en-gb
libreoffice-l10n-en-za
libreoffice-l10n-es
libreoffice-l10n-fr
libreoffice-l10n-it
libreoffice-l10n-pt-br
libreoffice-l10n-pt
libreoffice-l10n-ru
libreoffice-l10n-zh-cn
libreoffice-l10n-zh-tw
libreoffice-math
libreoffice-sdbc-hsqldb
libreoffice-style-colibre
libreoffice-writer
libsasl2-2
libsasl2-modules-db
libsasl2-modules
libsnmp-base
libsnmp40
libspa-0.2-modules
libssh-4
libssh-gcrypt-4
libuno-cppu3
libuno-cppuhelpergcc3-3
libuno-purpenvhelpergcc3-3
libuno-sal3
libuno-salhelpergcc3-3
libunoloader-java
libuutil3linux
libwebkit2gtk-4.0-37
libwebp7
libwebpdemux2
libwebpmux3
libx11-data
libxatracker2
libxpm4
libxreaderdocument3
libxreaderview3
libxtables12
libzfs4linux
libzpool5linux
lintian
linux-firmware
linux-generic
linux-headers-generic
linux-image-generic
linux-libc-dev
mesa-vdpau-drivers
metacity-common
metacity
mint-common
mint-mirrors
mint-themes
mint-upgrade-info
mintinstall
mintstick
mintupdate
modemmanager
mokutil
muffin-common
muffin-dbg
muffin
nautilus-data
ncurses-base
ncurses-bin
nemo-data
nemo-dbg
nemo
netplan.io
openjdk-11-jre-headless
openjdk-11-jre
openssh-client
openssl
perl-base
perl-modules-5.34
perl
pipewire-bin
pipewire
printer-driver-foo2zjs-common
printer-driver-foo2zjs
printer-driver-splix
python-apt-common
python3-apport
python3-apt
python3-louis
python3-macaroonbakery
python3-problem-report
python3-protobuf
python3-requests
python3-tz
python3-uno
rsync
shim-signed
slick-greeter
spotify-client
sticky
sudo
tar
tcpdump
thermald
thunderbird-gnome-support
thunderbird
timeshift
tzdata
ubuntu-drivers-common
uno-libs-private
ure-java
ure
vim-common
vim-tiny
warpinator
webapp-manager
xreader-common
xreader-dbg
xreader
xserver-common
xserver-xephyr
xserver-xorg-core
xserver-xorg-legacy
xviewer-dbg
xviewer
xwayland
xxd
zfs-initramfs
zfs-zed
zfsutils-linux

# requeried libs too
language-pack-en-base 
language-pack-gnome-en-base 
libreoffice-core
)







add_repos(){
    if [[ ! -v SKIP_ADD_REPOS ]]; then
        echo -e "\n=========================== ADDING REPOSITORIES ===========================\n"
        mkdir "repo.temp"; cd "repo.temp" || exit

        # appimagelauncher
        sudo add-apt-repository -y ppa:appimagelauncher-team/stable

        # quodlibet
        sudo add-apt-repository -y ppa:lazka/ppa 

        # keepassxc
        sudo add-apt-repository -y ppa:phoerious/keepassxc
        
        # kdiskmark
        sudo add-apt-repository -y ppa:jonmagon/kdiskmark 

        # vscode
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/tee packages.microsoft.gpg > /dev/null
        sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        # sudo apt-get install apt-transport-https
        sudo apt-get updatefailed_down_packages

        # opera
        wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
        sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"

        # github-desktop
        wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'

        # sublime-merge
        wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
        echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

        # uget-integrator
        sudo add-apt-repository -y ppa:uget-team/ppa

        # tlpui
        sudo add-apt-repository -y ppa:linuxuprising/apps

        # kdenlive
        sudo add-apt-repository -y ppa:kdenlive/kdenlive-stable

        cd ..; rm -r "repo.temp"
    fi
}



# ========================================== DOWNLOAD ====================================================

failed_down_packages=()
new_down_packages=()

add_failed_downloading(){
    local package="$1"
    echo -e "\n${RED}!!!!!!!!!!!! Failed to download \"$package\" !!!!!!!!!!!!${NOCOLOR}\n"
    failed_down_packages+=("$package")
}


remove_old_temp_files(){
    # find old temp files
    mapfile -t temp_files < <(find . -type f -name "*.1" -o -type f -name "*.temp" -o -type f -name "*.sig")

    if (( ${#temp_files[@]} )); then
        echo "Found ${#temp_files[@]} old temp files: "
        for i in "${!temp_files[@]}"; do
            echo "${temp_files[$i]}"
        done

        if [[ -v CONFIRM_ALL ]]; then confirm="Y"; else 
            read -p "Do you want to delete them? [Y/n] " confirm
        fi
        if [[ $confirm == [yY] || $confirm == "" ]]; then  ## Only delete the file if y or Y is pressed. Any other key would cancel it. It's safer this way.
            for i in "${!temp_files[@]}"; do
                rm "${temp_files[$i]}" && echo "File deleted: ${temp_files[$i]}"  ## Only echo if it was actually deleted and no error has happened. rm probably would send its own error info if it fails.
            done        
        fi
    fi

    # find old temp directories
    mapfile -t temp_dirs < <(find . -type d -name "*.temp")

    if (( ${#temp_dirs[@]} )); then
        echo "Found ${#temp_dirs[@]} old temp directories: "
        for i in "${!temp_dirs[@]}"; do
            echo "${temp_dirs[$i]}"
        done

        if [[ -v CONFIRM_ALL ]]; then confirm="Y"; else 
            read -p "Do you want to delete them? [Y/n] " confirm
        fi
        if [[ $confirm == [yY] || $confirm == "" ]]; then  ## Only delete the file if y or Y is pressed. Any other key would cancel it. It's safer this way.
            for i in "${!temp_dirs[@]}"; do
                rm -r "${temp_dirs[$i]}" && echo "Directory deleted: ${temp_dirs[$i]}"  ## Only echo if it was actually deleted and no error has happened. rm probably would send its own error info if it fails.
            done        
        fi
    fi
}


download_with_apt_offline(){
    local pkg_info="$1"
    local pkg_name="$2"
    local archive_name="$3"


    # skip if exist
    if [[ ! -v REDOWNLOAD_IF_EXIST && -f "$archive_name" ]]; then echo "Exist. Skipping."; return 0; fi

    # download
    sudo apt-offline set "$archive_name.sig" --install-packages "$pkg_name"
    if ! apt-offline get "$archive_name.sig" --bundle "$archive_name.temp"; then
        rm "$archive_name.temp"
    fi
    rm -f "$archive_name.sig"
    
    if [[ ! -f "$archive_name.temp" ]]; then 
        echo -e "${RED}Failed to download '$pkg_name'.${NOCOLOR}"
        return 1
    fi

    # if archive is empty (something wrong)
    filesize=$(wc -c <"$archive_name.temp")
    if (($filesize==0)); then
        rm -f "$archive_name.temp"
        echo -e "${RED}Filesize is zero!${NOCOLOR}"
        return 1;
    fi

    # delete old if exist
    if [[ -f "$archive_name" ]]; then rm -f "$archive_name"; fi

    # save downloaded archive
    mv "$archive_name.temp" "$archive_name"

    new_down_packages+=("$pkg_info")
}

download_with_wget(){
    local pkg_info="$1"
    local pkg_name="$2"
    local archive_name="$3"
    local url="$4"

    # skip if exist
    if [[ ! -v REDOWNLOAD_IF_EXIST && -f "$archive_name" ]]; then echo "Exist. Skipping."; return 0; fi

    # download
    rm -r "$pkg_name.temp"
    mkdir -p "$pkg_name.temp"
    cd "$pkg_name.temp" || return 1

    # use --continue or --backups=1 for overwrite existing file with original file name
    wget -q --show-progress "$url"

    down_filename="$(ls)"
    
    # if no file downloaded
    if [[ $down_filename == "" || ! -f $down_filename ]]; then 
        cd ..
        rm -r "$pkg_name.temp"
        echo -e "${RED}File was not downloaded!${NOCOLOR}"
        return 1; 
    fi

    # if file is empty (something wrong) 
    filesize=$(wc -c <"$down_filename") 
    if ((filesize==0)); then
        cd ..
        rm -r "$pkg_name.temp"
        echo -e "${RED}Filesize is zero!${NOCOLOR}"
        return 1; 
    fi
        
    # delete old if exist
    if [[ -f "../$archive_name" ]]; then rm -f "../$archive_name"; fi

    7z a "../$archive_name" "$down_filename" # using 7z instead of zip to showing the progress

    # clean
    cd ..
    rm -r "$pkg_name.temp"

    new_down_packages+=("$pkg_info")
}



download_packages(){
    echo -e "\n==========================================================================="
    echo -e "=========================== DOWNLOADING PACKAGES =========================="
    echo -e "===========================================================================\n"

    local dir="$1"
    shift
    local packages=("$@")

    for i in "${!packages[@]}"; do        
        local pkg_info=$(echo "${packages[$i]}" | sed 's/ //g') # remove spaces
        local pkg_dir="$dir/$(echo "$pkg_info" | cut -d "|" -f 1)"
        local pkg_name=$(echo "$pkg_info" | cut -d "|" -f 2)        
        local source=$(echo "$pkg_info" | cut -d "|" -f 3)
        local url=$(echo "$pkg_info" | cut -d "|" -f 4)
        local archive_name="$pkg_name.$source.zip"
        archive_name=$(echo "$archive_name" | tr -d "$invalid_chars") # remove invalid characters


        echo -e "\n==================== Donwloading package $((i+1)) / ${#packages[@]}: \"$pkg_name\"  ===================="

        

        if [[ $pkg_name == "" || $source == "" ]]; then add_failed_downloading "$pkg_info"; continue; fi

        # create download dir
        cd "$SCRIPT_DIR" || exit
        mkdir -p "$pkg_dir"
        cd "$pkg_dir" || exit        

        # downloading deb from apt repository
        if [[ $source == "apt" ]]; then
            if [[ -v SKIP_DOWNLOAD_APT ]]; then continue; fi
            if ! download_with_apt_offline "$pkg_info" "$pkg_name" "$archive_name"; then add_failed_downloading "$pkg_info"; continue; fi

        # downloading deb from site
        elif [[ $source == "deb" ]]; then
            if [[ -v SKIP_DOWNLOAD_DEB ]]; then continue; fi
            if ! download_with_wget "$pkg_info" "$pkg_name" "$archive_name" "$url"; then add_failed_downloading "$pkg_info"; continue; fi

        # downloading AppImage
        elif [[ $source == "AppImage" ]]; then
            if [[ -v SKIP_DOWNLOAD_APPIMAGE ]]; then continue; fi
            if ! download_with_wget "$pkg_info" "$pkg_name" "$archive_name" "$url"; then add_failed_downloading "$pkg_info"; continue; fi

        # downloading bundle
        elif [[ $source == "bundle" ]]; then
            if [[ -v SKIP_DOWNLOAD_BUNDLE ]]; then continue; fi
            if ! download_with_wget "$pkg_info" "$pkg_name" "$archive_name" "$url"; then add_failed_downloading "$pkg_info"; continue; fi
        
        # downloading bin
        elif [[ $source == "bin" ]]; then
            if [[ -v SKIP_DOWNLOAD_BIN ]]; then continue; fi
            if ! download_with_wget "$pkg_info" "$pkg_name" "$archive_name" "$url"; then add_failed_downloading "$pkg_info"; continue; fi

        # downloading installer
        elif [[ $source == "installer" ]]; then
            if [[ -v SKIP_DOWNLOAD_INSTALLER ]]; then continue; fi
            if ! download_with_wget "$pkg_info" "$pkg_name" "$archive_name" "$url"; then add_failed_downloading "$pkg_info"; continue; fi

        else
            add_failed_downloading "$pkg_info"            
            echo "Unknown source!"
            continue;
        fi
    done
}

download_libs(){
    if [[ -v SKIP_DOWNLOAD_LIBS ]]; then return; fi

    echo -e "\n==========================================================================="
    echo -e "========================== DOWNLOADING LIBS ==============================="
    echo -e "===========================================================================\n"

    local dir="$1"
    shift
    local packages=("$@")

    # create download dir
    cd "$SCRIPT_DIR" || exit
    mkdir -p "$dir"
    cd "$dir" || exit    

    # downloading
    for i in "${!packages[@]}"; do        
        local pkg_name="${packages[$i]}"

        echo -e "\n==================== Donwloading library $((i+1)) / ${#packages[@]}: \"$pkg_name\"  ===================="

        if [[ $pkg_name == "" ]]; then add_failed_downloading "$pkg_name"; continue; fi

        # download with apt-offline including dependecies
        sudo apt-offline set "$pkg_name.sig" --install-packages "$pkg_name"
        # apt-offline get "$pkg_name.sig" --bundle "$pkg_name.zip"
        apt-offline get "$pkg_name.sig" --download-dir .
        rm -f "$pkg_name.sig"

        new_down_packages+=("$pkg_name")
    done
}



download_libs_to_archives(){
    if [[ -v SKIP_DOWNLOAD_LIBS ]]; then return; fi

    echo -e "\n==========================================================================="
    echo -e "========================== DOWNLOADING LIBS ==============================="
    echo -e "===========================================================================\n"

    local dir="$1"
    shift
    local packages=("$@")

    # create download dir
    cd "$SCRIPT_DIR" || exit
    mkdir -p "$dir"
    cd "$dir" || exit    

    # downloading
    mkdir -p "libs.temp"
    cd "libs.temp" || exit   
    for i in "${!packages[@]}"; do        
        local pkg_name="${packages[$i]}"

        echo -e "\n==================== Donwloading library $((i+1)) / ${#packages[@]}: \"$pkg_name\"  ===================="

        if [[ $pkg_name == "" ]]; then add_failed_downloading "$pkg_name"; continue; fi

        # skip if exist
        if [[ ! -v REDOWNLOAD_IF_EXIST && -f "../$pkg_name.zip" ]]; then echo "Exist. Skipping."; continue; fi

        # download with apt without dependecies
        # if ! apt download "$pkg_name"; then add_failed_downloading "$pkg_name"; continue; fi
        # 7z a "$pkg_name.zip" *.deb

        # download with apt-offline including dependecies
        sudo apt-offline set "$pkg_name.sig" --install-packages "$pkg_name"
        apt-offline get "$pkg_name.sig" --bundle "$pkg_name.zip"
        rm -f "$pkg_name.sig"

        # if archive is empty (something wrong)
        filesize=$(wc -c <"$pkg_name.zip")
        if (($filesize==0)); then
            rm -f "$pkg_name.zip"
            add_failed_downloading "$pkg_name"; 
            continue;
        fi

        mv "$pkg_name.zip" ..

        # clean
        rm $pkg_name*.deb

        new_down_packages+=("$pkg_name")
    done
    cd ..
    rm -r "libs.temp"
}


# ================================= INSTALL =========================================

failed_inst_packages=()
new_inst_packages=()

unachive_in_subdir(){
    local temp_dir="$1" 
    local temp_file="$2" 
    local archive_name="$3" 

    mkdir -p "$temp_dir"
    if [[ $temp_file == *.tar.gz ]]; then
        if ! tar -xf "$temp_file" -C "$temp_dir" --checkpoint=.1000; then rm -r "$temp_dir"; return 1; fi
    elif [[ $temp_file == *.tar.xz ]]; then
        if ! tar -xf "$temp_file" -C "$temp_dir" --checkpoint=.1000; then rm -r "$temp_dir"; return 1; fi
    elif [[ $temp_file == *.zip ]]; then
        if ! 7z x "$temp_file" -0"$temp_dir"; then rm -r "$temp_dir"; return 1; fi
    elif [[ $temp_file == *.7z ]]; then
        if ! 7z x "$temp_file" -o"$temp_dir"; then rm -r "$temp_dir"; return 1; fi
    else
        rm -r "$temp_dir"
        echo Unsupported archive type
        return 1
    fi
}

add_failed_install(){
    local package="$1"
    echo -e "\n${RED}!!!!!!!!!!!! Failed to install \"$package\" !!!!!!!!!!!!${NOCOLOR}\n"
    failed_inst_packages+=("$package")
}

install_with_apt_offline(){
    local pkg_name="$1"
    local archive_name="$2"

    # doesn`t work offline 
    # # install
    # if ! sudo apt-offline install "$archive_name"; then return 1; fi

    # if [[ -v REINSTALL ]]; then
    #     if ! sudo apt --reinstall install "$pkg_name"; then return 1; fi
    # else
    #     if ! sudo apt install "$pkg_name"; then return 1; fi
    # fi   

    # unachive
    7z x "$archive_name" -o"$archive_name.temp"
    cd "$archive_name.temp" || return 1

    # install
    mapfile -t files < <(find . -name "*.deb")
    for i in "${!files[@]}"; do
        echo "Installing ${files[$i]}"
        sudo dpkg -i "${files[$i]}"
    done

    # clean
    cd ..
    rm -r "$archive_name.temp"
}

install_deb(){
    local archive_name="$1"

    # unachive
    7z x "$archive_name" -o"$archive_name.temp"
    cd "$archive_name.temp" || return 1

    # install
    mapfile -t files < <(find . -name "*.deb")
    for i in "${!files[@]}"; do
        echo "Installing ${files[$i]}"
        sudo dpkg -i "${files[$i]}"
    done

    # clean
    cd ..
    rm -r "$archive_name.temp"
}

install_appimage(){
    local archive_name="$1"

    # unachive
    7z x "$archive_name" -o"$archive_name.temp"
    cd "$archive_name.temp" || return 1

    # install
    mkdir -p ~/Applications
    mapfile -t files < <(find . -name "*.AppImage")
    for i in "${!files[@]}"; do
        echo "Installing ${files[$i]}"
        if [[ -f "$HOME/Applications/${files[$i]}" ]]; then 
            echo "App already installed. Skip."
        else
            mv "${files[$i]}" "$HOME/Applications"
            chmod +x "$HOME/Applications/${files[$i]}"
        fi
    done

    # clean
    cd ..
    rm -r "$archive_name.temp"
}

install_bundle(){
    local archive_name="$1"

    # unachive
    7z x "$archive_name" -o"$archive_name.temp"
    cd "$archive_name.temp" || return 1

    # install
    mapfile -t files < <(find . -name "*.bundle")
    for i in "${!files[@]}"; do
        echo "Installing ${files[$i]}"
        chmod +x "${files[$i]}"
        sudo "${files[$i]}" 
    done

    # clean
    cd ..
    rm -r "$archive_name.temp"
}


install_bin(){    
    local pkg_name="$1"
    local archive_name="$2"

    install_dir="/opt"

    if [[ ! -v REINSTALL && -d "$install_dir/$pkg_name" ]]; then
        echo "Directory \"$install_dir/$pkg_name\" already exist. Skip."
        return
    fi

    # unachive
    7z x "$archive_name" -o"$archive_name.temp"
    cd "$archive_name.temp" || return 1

    temp_file="$(ls)"  


    if [[ $temp_file == *".gz" || $temp_file == *".xz" || $temp_file == *".zip" || $temp_file == *".7z" ]]; then
        # unachive internal archive
        if ! unachive_in_subdir "$pkg_name" "$temp_file" "$archive_name"; then
            # clean
            cd ..
            echo -e "${RED}Failed to unpack archive!${NOCOLOR}"
            rm -r "$archive_name.temp"
            return 1
        fi

        cd "$pkg_name" || return 1
    fi

    unarchived_dir="$(ls)"

    # if it is a directory
    if [[ -d "$unarchived_dir" ]]; then
        # rename to package name
        mv "$unarchived_dir" "$pkg_name"
    # if it is a file
    elif [[ -f "$unarchived_dir" ]]; then
        # move it to folder
        mkdir -p "$pkg_name"
        mv "$unarchived_dir" "$pkg_name"
    else
        echo -e "${RED}Cant recognize archive content!${NOCOLOR}"
        return 1
    fi

    unarchived_dir="$pkg_name"

    if [[ -v REINSTALL && -d "$install_dir/$pkg_name" ]]; then
        echo "Directory \"$install_dir/$pkg_name\" already exist."
        if [[ -v CONFIRM_ALL ]]; then confirm="Y"; else 
            read -p "Do you want to delete it and reinstall package? [y/N] " confirm
        fi
        if [[ $confirm == [yY] ]]; then  ## Only delete if y or Y is pressed. Any other key would cancel it. It's safer this way.
            rm -r "$install_dir/$pkg_name" && echo "Directory deleted: $install_dir/$pkg_name"  ## Only echo if it was actually deleted and no error has happened. rm probably would send its own error info if it fails.    
        else
            echo "Skiping."
            cd ../..
            rm -r "$archive_name.temp"
            return
        fi
    fi

    echo "Extracting \"$unarchived_dir\" to /opt/"
    sudo mv "$unarchived_dir" "$install_dir"

    # if is was an archive
    if [[ $temp_file == *".gz" || $temp_file == *".xz" || $temp_file == *".zip" || $temp_file == *".7z" ]]; then
        cd ..
    fi

    # clean
    cd ..
    rm -r "$archive_name.temp"
}




install_installer(){
    local pkg_name="$1" 
    local archive_name="$2"
    local exec="$3"

    # unachive
    7z x "$archive_name" -o"$archive_name.temp"
    cd "$archive_name.temp" || return 1
    temp_file="$(ls)"   

    # unachive internal
    if ! unachive_in_subdir "$pkg_name" "$temp_file" "$archive_name"; then
        # clean
        cd ..
        echo -e "${RED}Filed to unpack archive!${NOCOLOR}"
        rm -r "$archive_name.temp"
        return 1
    fi

    cd "$pkg_name" || return 1

    # install
    eval $exec

    # clean
    cd ../../..
    rm -r "$archive_name.temp"
}


install_packages(){
    echo -e "\n==========================================================================="
    echo -e "=========================== INSTALLING PACKAGES ==========================="
    echo -e "===========================================================================\n"
    local dir="$1"
    shift
    local packages=("$@")

    for i in "${!packages[@]}"; do        
        local pkg_info=${packages[$i]}
        local pkg_dir="$dir/$(echo "$pkg_info" | cut -d "|" -f 1 | sed 's/ //g')" # remove spaces
        local pkg_name=$(echo "$pkg_info" | cut -d "|" -f 2 | xargs) # xargs for trim spaces       
        local source=$(echo "$pkg_info" | cut -d "|" -f 3 | xargs)
        local url=$(echo "$pkg_info" | cut -d "|" -f 4 | xargs)
        local args=$(echo "$pkg_info" | cut -d "|" -f 5 | xargs)
        local archive_name="$pkg_name.$source.zip"
        archive_name=$(echo "$archive_name" | tr -d "$invalid_chars") # remove invalid characters

        echo -e "\n==================== Installing package $((i+1)) / ${#packages[@]}: \"$pkg_name\"  ===================="

        if [[ $pkg_name == "" || $source == "" ]]; then add_failed_install "$pkg_info"; continue; fi

        # cd to package dir
        cd "$SCRIPT_DIR" || exit
        if ! cd "$pkg_dir"; then echo "No path found"; add_failed_install "$pkg_info"; continue; fi

        # install deb from apt repository
        if [[ $source == "apt" ]]; then
            if [[ -v SKIP_INSTALL_APT ]]; then continue; fi
            if ! install_with_apt_offline "$pkg_name" "$archive_name"; then add_failed_install "$pkg_info"; continue; fi

        # install deb from site
        elif [[ $source == "deb" ]]; then
            if [[ -v SKIP_INSTALL_DEB ]]; then continue; fi
            if ! install_deb "$archive_name"; then add_failed_install "$pkg_info"; continue; fi

        # install AppImage
        elif [[ $source == "AppImage" ]]; then
            if [[ -v SKIP_INSTALL_APPIMAGE ]]; then continue; fi
            if ! install_appimage "$archive_name"; then add_failed_install "$pkg_info"; continue; fi

        # install bundle
        elif [[ $source == "bundle" ]]; then
            if [[ -v SKIP_INSTALL_BUNDLE ]]; then continue; fi
            if ! install_bundle "$archive_name"; then add_failed_install "$pkg_info"; continue; fi
        
        # install bin
        elif [[ $source == "bin" ]]; then
            if [[ -v SKIP_INSTALL_BIN ]]; then continue; fi
            if ! install_bin "$pkg_name" "$archive_name" ; then add_failed_install "$pkg_info"; continue; fi

        # install installer
        elif [[ $source == "installer" ]]; then
            if [[ -v SKIP_INSTALL_INSTALLER ]]; then continue; fi
            if ! install_installer "$pkg_name" "$archive_name" "$args"; then add_failed_install "$pkg_info"; continue; fi

        else
            add_failed_install "$pkg_info"            
            echo "Unknown source!"
            continue;
        fi
    done
}

install_libs(){
    if [[ -v SKIP_INSTALL_LIBS ]]; then return; fi

    echo -e "\n==========================================================================="
    echo -e "============================ INSTALLING LIBS =============================="
    echo -e "===========================================================================\n"


    local dir="$1"
    shift
    local packages=("$@")

    # cd to package dir
    cd "$SCRIPT_DIR" || exit
    if ! cd "$dir"; then echo "No libs path found"; return 1; fi  

    mapfile -t files < <(find . -name "*.deb")
        

    # installing
    for i in "${!files[@]}"; do      

        echo -e "\n==================== Installing library $((i+1)) / ${#files[@]}: \"${files[$i]}\"  ===================="
       
        sudo dpkg -i "${files[$i]}"
    done
}


install_libs_from_archives(){
    if [[ -v SKIP_INSTALL_LIBS ]]; then return; fi

    echo -e "\n==========================================================================="
    echo -e "============================ INSTALLING LIBS =============================="
    echo -e "===========================================================================\n"


    local dir="$1"
    shift
    local packages=("$@")

    # cd to package dir
    cd "$SCRIPT_DIR" || exit
    if ! cd "$dir"; then echo "No libs path found"; return 1; fi  

    # installing
    for i in "${!packages[@]}"; do        
        local pkg_name="${packages[$i]}"

        echo -e "\n==================== Installing library $((i+1)) / ${#packages[@]}: \"$pkg_name\"  ===================="

        if [[ $pkg_name == "" ]]; then add_failed_install "$pkg_name"; continue; fi

        # skip if exist
        if [[ ! -f "$pkg_name.zip" ]]; then echo "Archive not found"; add_failed_install "$pkg_name"; continue; fi

  
        # unachive
        7z x "$pkg_name.zip" -o"$pkg_name.temp"
        if ! cd "$pkg_name.temp"; then add_failed_install "$pkg_name"; continue; fi

        # install
        mapfile -t files < <(find . -name "*.deb")
        for i in "${!files[@]}"; do
            echo "Installing ${files[$i]}"
            sudo dpkg -i "${files[$i]}"
        done

        # clean
        cd ..
        rm -r "$pkg_name.temp"

     
    done
}

# ================================= FINAL =========================================

print_result(){
    echo -e "\n========================== COMPLETE =========================="

     if ((${#new_down_packages[@]}>0)); then
        echo "New packages downloaded (${#new_down_packages[@]}):"
        for pack in "${new_down_packages[@]}"; do
            echo "$pack"
        done
        echo =============================================================
    fi   

    if ((${#failed_down_packages[@]}>0)); then
        echo -e "${RED}"        
        echo "Packages have not been downloaded due to some errors (${#failed_down_packages[@]}):"
        for pack in "${failed_down_packages[@]}"; do
            echo "$pack"
        done
        echo -e "${NOCOLOR}"
        echo =============================================================
    fi

    if ((${#failed_inst_packages[@]}>0)); then
        echo -e "${RED}"       
        echo "Packages have not been installed due to some errors (${#failed_inst_packages[@]}):"
        for pack in "${failed_inst_packages[@]}"; do
            echo "$pack"
        done
        echo -e "${NOCOLOR}"
        echo =============================================================
    fi
}

# ======================== CREATE OFFLINE PACKAGES INSTALLERS ========================

create_offline_installers(){
    clear
    echo "This script will help you create software installation packages that you can re-install offline on a freshly installed Linux system."
    echo ""
    echo "To download programs with all dependencies, you need to run this script on a freshly installed system that hasn't been updated with packages or installed any programs yet."
    echo "Only in this way will you get programs with all the libraries that can be installed offline."
    echo ""
    echo "However, you can also use this script to quickly install all the necessary software on any system, not necessarily fresh. But keep in mind that in this case, the program archives will only have dependencies necessary for the current state of the system and will not be suitable for a freshly installed system."
    echo ""
    echo "This wizard will tell you how to download programs on a fresh system installed in a virtual machine." 
    echo "If you run the script on a bare, freshly installed system, then you don't need a virtual machine and this wizard, just edit the list of required software in this script, re-run the script and download the packages (mode D) and install (mode I)."
    echo ""
    echo ""
    echo "Step1:"
    echo ""
    echo "- Edit this script CONFIG section, add software and libraries you like."
    echo ""
    read -p "Press Enter to contune..."
    echo ""
    echo "Step2:"
    echo ""
    echo "- Create VMWare Virtual Machine, change Network Adapter to Host Only mode and install Linux."
    echo "Host Only mode is needed to prevent updating packages."
    echo "- Shut Down virual machine after installing Linux."
    echo ""
    read -p "Press Enter to contune..."
    echo ""
    echo "Step3:"
    echo ""
    echo "- Create \"~/Shared\" folder on Host machine and place this script there."
    echo "- Add \"~/Shared\" folder to Virtual Machine Settings > Options > Shared Folders (Always enabled)."
    echo "This folder will be shared between Host and VM."
    echo ""
    read -p "Press Enter to contune..."
    echo ""
    echo "Step4:"
    echo ""
    echo "- Create Virual Machine snapshot."
    echo "- Change VM Network Adapter mode to Nat."
    echo "- Power On virtual machine."
    echo ""
    read -p "Press Enter to contune..."
    echo ""
    echo "Step5:"
    echo ""
    echo "- Run this script on VM at \"/mnt/hgfs/Shared/\" and select Mode 2 (Download packages)."
    echo "- After downloading you can start script again if somethig wrong. Process will continue, new packages will be downloaded."
    echo "- Complete! "
    echo ""
    echo "For installing packages offline, just start this script with Mode 3 (Install packages offline)."
    echo ""
    echo "You can add new packages to this script CONFIG section and run \"Download packages\" again at any time for adding new packages."
    echo "But remember! Always download from apt repositories only on fresh installed Linux to include all the necessary dependencies!"
    echo "There is no need to download all packages again, only new packages will be downloaded."
    echo "You can use environment variables to make the script more subtle. All variables are listed in a comment at the top of the script."
    echo ""
    read -p "Press Enter to exit..."
}


# ================================= APP =========================================

BLUE='\033[0;34m'
RED='\033[0;91m'
NOCOLOR='\033[0m'

# go to script directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || exit

if ! command -v apt-offline &> /dev/null
then
    echo -e "${RED} apt-offline is not installed. Install it first. ${NOCOLOR}"
    exit
fi


invalid_chars="\/:*?\"<>|"

# ------------------------------------------------------------------------------

MODE=$1

if [[  $MODE == "--help" ]]; then
    echo "Start without args - Start Wizard"
    echo "--download - download packages"
    echo "--install - install packages offline"
fi


if [[ ! -v MODE || $MODE == "" ]]; then
    echo "D - Download packages"
    echo "I - Install packages offline"
    echo "S - Start interactive help wizard (recomended)"
    read -p "Select mode:" MODE
fi

# Create offline package installers
if [[ $MODE == [sS] ]]; then 
    create_offline_installers
    exit
fi


# Download packages
if [[ $MODE == [dD] || $MODE == "--download" ]]; then 
    remove_old_temp_files
    add_repos
    apt update
    download_packages "./" "${soft[@]}"
    download_libs_to_archives "./Libs/" "${libs[@]}"
    download_libs "./Update/" "${update[@]}"
    print_result
    exit
fi

# Install packages offline
if [[ $MODE == [iI] || $MODE == "--install" ]]; then 
    remove_old_temp_files
    install_packages "./" "${soft[@]}"
    install_libs_from_archives "./Libs/" "${libs[@]}"
    install_libs "./Update/" "${update[@]}"
    apt install -f -y # fix issues
    print_result
    exit
fi



