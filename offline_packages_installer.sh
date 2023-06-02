#!/bin/bash


# ================================= CONFIG =========================================

# MODE=1

# CONFIRM_ALL=true

# REDOWNLOAD_IF_EXIST=true
# SKIP_ADD_REPOS=true
# SKIP_DOWNLOAD_APK=true
# SKIP_DOWNLOAD_DOWNLOAD_DEB=true
# SKIP_DOWNLOAD_APPIMAGE=true
# SKIP_DOWNLOAD_BUNDLE=true
# SKIP_DOWNLOAD_BIN=true
# SKIP_DOWNLOAD_LIBS=true

# REINSTALL=true
# SKIP_INSTALL_APK=true
# SKIP_INSTALL_DOWNLOAD_DEB=true
# SKIP_INSTALL_APPIMAGE=true
# SKIP_INSTALL_BUNDLE=true
# SKIP_INSTALL_BIN=true
# SKIP_INSTALL_LIBS=true


soft=(
"LINUX-DEV/Blender | blender | apt" 
"LINUX-DEV/C++ | cmake | apt" 
"LINUX-DEV/C++ | g++ | apt" 
"LINUX-DEV/C++ | ninja-build  | apt" 
"LINUX-DEV/Docker | docker | apt" 
"LINUX-DEV/Docker | docker-compose | apt" 
"LINUX-DEV/Docker | docker-doc | apt" 
"LINUX-DEV/Docker | docker-registry | apt" 
"LINUX-DEV/Docker | docker.io | apt" 
"LINUX-DEV/Git | git | apt" 
"LINUX-DEV/Git | gitkraken | deb | https://release.gitkraken.com/linux/gitkraken-amd64.deb" 
"LINUX-DEV/Node | nodejs  | apt" 
"LINUX-DEV/Node | npm  | apt" 
"LINUX-DEV/REST | httpie  | apt" 
"LINUX-DEV/VSCode | apt-transport-https  | apt" 
"LINUX-DEV/VSCode | code  | apt" 
"LINUX-SOFT/Archivers | peazip | deb | https://github.com/peazip/PeaZip/releases/download/9.2.0/peazip_9.2.0.LINUX.GTK2-1_amd64.deb" # https://peazip.github.io/peazip-linux.html 
"LINUX-SOFT/Audio/Editors | audacity | apt" 
"LINUX-SOFT/Audio/Editors | reaper | bin | https://www.reaper.fm/files/6.x/reaper680_linux_x86_64.tar.xz" # https://www.reaper.fm/download.php
"LINUX-SOFT/Audio/Editors | saucedacity | AppImage | https://github.com/tenacityteam/saucedacity/releases/download/v1.2.1/saucedacity-1.2.1-linux-x86_64.AppImage" # https://github.com/tenacityteam/saucedacity/releases
"LINUX-SOFT/Audio/Editors | tenacity | AppImage | https://codeberg.org/attachments/f0e0697d-0f41-4446-b688-781f903dcd77" # https://codeberg.org/tenacityteam/tenacity/releases
"LINUX-SOFT/Audio/Jack | jackd2 | apt" 
"LINUX-SOFT/Audio/Players | quodlibet | apt" 
"LINUX-SOFT/Crypt | keepassxc | apt" 
"LINUX-SOFT/Crypt | veracrypt | deb | https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-Ubuntu-22.04-amd64.deb" # https://www.veracrypt.fr/en/Downloads.html
"LINUX-SOFT/Crypt | veracrypt-console | deb | https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-console-1.25.9-Ubuntu-22.04-amd64.deb" # https://www.veracrypt.fr/en/Downloads.html
"LINUX-SOFT/Disk | krusader | apt" 
"LINUX-SOFT/Disk/Backup | clonezilla | apt" 
"LINUX-SOFT/Graphics | gimp | apt" 
"LINUX-SOFT/Graphics | XnViewMP | deb | https://download.xnview.com/XnViewMP-linux-x64.deb"  # https://www.xnview.com/en/xnviewmp/#downloads
"LINUX-SOFT/Internet | opensnitch | deb | https://github.com/evilsocket/opensnitch/releases/download/v1.6.0-rc.5/opensnitch_1.6.0-rc.5-1_amd64.deb" # https://github.com/evilsocket/opensnitch/releases
"LINUX-SOFT/IOT | hyperion | deb | https://github.com/hyperion-project/hyperion.ng/releases/download/2.0.15/Hyperion-2.0.15-Linux-x86_64.deb" # https://github.com/hyperion-project/hyperion.ng/releases 
"LINUX-SOFT/System | appimagelauncher | apt"
"LINUX-SOFT/System/Display | xbacklight | apt" 
"LINUX-SOFT/System/Mouse | barrier | apt" 
"LINUX-SOFT/System/Test | Geekbench5 | bin | https://cdn.geekbench.com/Geekbench-5.5.1-Linux.tar.gz" # https://www.geekbench.com/legacy/
"LINUX-SOFT/System/Test | Geekbench6 | bin | https://cdn.geekbench.com/Geekbench-6.0.3-Linux.tar.gz" # https://www.geekbench.com/download/
"LINUX-SOFT/Text | doublecmd-qt | apt"
"LINUX-SOFT/Text | kdiskmark | apt" 
"LINUX-SOFT/Text | obsidian | deb | https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.4/obsidian_1.3.4_amd64.deb" # https://obsidian.md/download
"LINUX-SOFT/Video | obs-studio | apt" 
"LINUX-SOFT/Video | vlc | apt" 
"LINUX-SOFT/VM/VirtualBox | virtualbox-guest-additions-iso | apt" 
"LINUX-SOFT/VM/VirtualBox | virtualbox-qt | apt" 
"LINUX-SOFT/VM/VMWare | open-vm-tools-desktop | apt" 
"LINUX-SOFT/VM/VMWare | vmware-workstation | bundle | https://download3.vmware.com/software/WKST-1702-LX/VMware-Workstation-Full-17.0.2-21581411.x86_64.bundle" # https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html
)

# after installing apps offline, run "apt install -f -y" to get the list of required additional libs and put it here
libs=(
    libcec6 
    libgdk-pixbuf-xlib-2.0-0 
    libgdk-pixbuf2.0-0 
    libnetfilter-queue1
    libp8-platform2
)


add_repos(){
    if [[ ! -v SKIP_ADD_REPOS ]]; then
        echo -e "\n=========================== ADDING REPOSITORIES ===========================\n"
        # appimagelauncher
        sudo add-apt-repository -y ppa:appimagelauncher-team/stable

        # quodlibet
        sudo add-apt-repository -y ppa:lazka/ppa 

        # keepassxc
        sudo add-apt-repository -y ppa:phoerious/keepassxc
        
        # kdiskmark
        sudo add-apt-repository -y ppa:jonmagon/kdiskmark 

        # doublecmd-qt
        echo 'deb http://download.opensuse.org/repositories/home:/Alexx2000/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:Alexx2000.list
        curl -fsSL https://download.opensuse.org/repositories/home:Alexx2000/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_Alexx2000.gpg > /dev/null

        # vscode
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/tee packages.microsoft.gpg > /dev/null
        sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        
        # sudo apt-get install apt-transport-https
        sudo apt-get updatefailed_down_packages
    fi
}



# ========================================== DOWNLOAD ====================================================

failed_down_packages=()
new_down_packages=()

add_failed_downloading(){
    local package="$1"
    echo -e "\n${RED}!!!!!!!!!!!! Cant download \"$package\" !!!!!!!!!!!!${NOCOLOR}\n"
    failed_down_packages+=("$package")
}


remove_old_temp_files(){
    # find old temp files
    mapfile -t temp_files < <(find . -type f -name "*.1" -o -type f -name "*.temp")

    if (( ${#temp_files[@]} )); then
        echo "Found ${#temp_files[@]} old temp files: "
        for i in "${!temp_files[@]}"; do
            echo "${temp_files[$i]}"
        done

        if [[ -v CONFIRM_ALL ]]; then confirm="Y"; else 
            read -p "Do you want to delete them? [y/N] " confirm
        fi
        if [[ $confirm == [yY] ]]; then  ## Only delete the file if y or Y is pressed. Any other key would cancel it. It's safer this way.
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
            read -p "Do you want to delete them? [y/N] " delete
        fi
        if [[ $delete == [yY] ]]; then  ## Only delete the file if y or Y is pressed. Any other key would cancel it. It's safer this way.
            for i in "${!temp_dirs[@]}"; do
                rm -r "${temp_dirs[$i]}" && echo "Directory deleted: ${temp_dirs[$i]}"  ## Only echo if it was actually deleted and no error has happened. rm probably would send its own error info if it fails.
            done        
        fi
    fi
}


download_with_apt_offline(){
    local package="$1"
    local archive_name="$2"
    local pkg_info="$3"

    # skip if exist
    if [[ ! -v REDOWNLOAD_IF_EXIST && -f "$archive_name" ]]; then echo "Exist. Skipping."; return 0; fi

    # download
    sudo apt-offline set "$package.sig" --install-packages "$package"
    apt-offline get "$package.sig" --bundle "$archive_name.temp"
    rm -f "$package.sig"
    
    if [[ ! -f "$archive_name.temp" ]]; then return 1; fi

    # if archive is empty (something wrong)
    filesize=$(wc -c <"$archive_name.temp")
    if (($filesize==0)); then
        rm -f "$archive_name.temp"
        return 1;
    fi

    # delete old if exist
    if [[ -f "$archive_name" ]]; then rm -f "$archive_name"; fi

    # save downloaded archive
    mv "$archive_name.temp" "$archive_name"

    new_down_packages+=("$pkg_info")
}

download_with_wget(){
    local url="$1"
    local archive_name="$2"
    local pkg_info="$3"

    # skip if exist
    if [[ ! -v REDOWNLOAD_IF_EXIST && -f "$archive_name" ]]; then echo "Exist. Skipping."; return 0; fi

    # download
    # use --continue or --backups=1 for overwrite existing file with original file name
    down_filename=$(wget --backups=1 --content-disposition "$url" 2>&1 | grep "Saving to" --line-buffered | sed -r 's/Saving to: ‘(.*)’/\1/')

    # if no file downloaded
    if [[ $down_filename == "" || ! -f $down_filename ]]; then return 1; fi

    # if archive is empty (something wrong) 
    filesize=$(wc -c <"$down_filename") 
    if ((filesize==0)); then
        rm -f "$down_filename"
        return 1;
    fi
    
    # delete old if exist
    if [[ -f "$archive_name" ]]; then rm -f "$archive_name"; fi

    zip "$archive_name" "$down_filename"

    # delete downloaded file
    rm -f "$down_filename"

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
        archive_name="$pkg_name.$source.zip"

        echo -e "\n==================== Donwloading package $((i+1)) / ${#packages[@]}: \"$pkg_name\"  ===================="

        if [[ $pkg_name == "" || $source == "" ]]; then add_failed_downloading "$pkg_info"; continue; fi

        # create download dir
        cd "$SCRIPT_DIR" || exit
        mkdir -p "$pkg_dir"
        cd "$pkg_dir" || exit        

        # downloading deb from apt repository
        if [[ $source == "apt" ]]; then
            if [[ -v SKIP_DOWNLOAD_APK ]]; then continue; fi
            if ! download_with_apt_offline "$pkg_name" "$archive_name" "$pkg_info"; then add_failed_downloading "$pkg_info"; continue; fi

        # downloading deb from site
        elif [[ $source == "deb" ]]; then
            if [[ -v SKIP_DOWNLOAD_DEB ]]; then continue; fi
            if ! download_with_wget "$url" "$archive_name" "$pkg_info"; then add_failed_downloading "$pkg_info"; continue; fi

        # downloading AppImage
        elif [[ $source == "AppImage" ]]; then
            if [[ -v SKIP_DOWNLOAD_APPIMAGE ]]; then continue; fi
            if ! download_with_wget "$url" "$archive_name" "$pkg_info"; then add_failed_downloading "$pkg_info"; continue; fi

        # downloading bundle
        elif [[ $source == "bundle" ]]; then
            if [[ -v SKIP_DOWNLOAD_BUNDLE ]]; then continue; fi
            if ! download_with_wget "$url" "$archive_name" "$pkg_info"; then add_failed_downloading "$pkg_info"; continue; fi
        
        # downloading bin
        elif [[ $source == "bin" ]]; then
            if [[ -v SKIP_DOWNLOAD_BIN ]]; then continue; fi
            if ! download_with_wget "$url" "$archive_name" "$pkg_info"; then add_failed_downloading "$pkg_info"; continue; fi

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
        # zip "$pkg_name.zip" *.deb

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

add_failed_install(){
    local package="$1"
    echo -e "\n${RED}!!!!!!!!!!!! Cant install \"$package\" !!!!!!!!!!!!${NOCOLOR}\n"
    failed_inst_packages+=("$package")
}

install_with_apt_offline(){
    local package="$1"
    local archive_name="$2"
    local pkg_info="$3"

    # doesn`t work offline 
    # # install
    # if ! sudo apt-offline install "$archive_name"; then return 1; fi

    # if [[ -v REINSTALL ]]; then
    #     if ! sudo apt --reinstall install "$package"; then return 1; fi
    # else
    #     if ! sudo apt install "$package"; then return 1; fi
    # fi    

    # unachive
    unzip "$archive_name" -d "$archive_name.temp"
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
    local url="$1"
    local archive_name="$2"
    local pkg_info="$3"

    # unachive
    unzip "$archive_name" -d "$archive_name.temp"
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
    local url="$1"
    local archive_name="$2"
    local pkg_info="$3"

    # unachive
    unzip "$archive_name" -d "$archive_name.temp"
    cd "$archive_name.temp" || return 1

    # install
    mkdir -p ~/Applications
    mapfile -t files < <(find . -name "*.AppImage")
    for i in "${!files[@]}"; do
        echo "Installing ${files[$i]}"
        if [[ -f "$HOME/Applications/${files[$i]}" ]]; then 
            echo "App already installed. Skip."
        else
            cp "${files[$i]}" "$HOME/Applications"
            chmod +x "$HOME/Applications/${files[$i]}"
        fi
    done

    # clean
    cd ..
    rm -r "$archive_name.temp"
}

install_bundle(){
    local url="$1"
    local archive_name="$2"
    local pkg_info="$3"

    # unachive
    unzip "$archive_name" -d "$archive_name.temp"
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
    local url="$1"
    local archive_name="$2"
    local pkg_info="$3"
    local pkg_name="$4"

    install_dir="/opt"

    if [[ ! -v REINSTALL && -d "$install_dir/$pkg_name" ]]; then
        echo "Directory \"$install_dir/$pkg_name\" already exist. Skip."
        return
    fi

    # unachive
    unzip "$archive_name" -d "$archive_name.temp"
    cd "$archive_name.temp" || return 1

    temp_file="$(ls)"    

    # unachive
    mkdir -p "$pkg_name"
    if [[ $temp_file == *.tar.gz ]]; then
        if ! tar -xf "$temp_file" -C "$pkg_name"; then rm -r "$archive_name.temp"; return 1; fi
    elif [[ $temp_file == *.tar.xz ]]; then
        if ! tar -xf "$temp_file" -C "$pkg_name"; then rm -r "$archive_name.temp"; return 1; fi
    elif [[ $temp_file == *.zip ]]; then
        if ! unzip "$temp_file" -d "$pkg_name"; then rm -r "$archive_name.temp"; return 1; fi
    elif [[ $temp_file == *.7z ]]; then
        if ! 7z x "$temp_file" -o"$pkg_name"; then rm -r "$archive_name.temp"; return 1; fi
    else
        rm -r "$archive_name.temp"
        echo Unsupported archive type
        return 1
    fi

    cd "$pkg_name" || return 1
    unarchived_dir="$(ls)"
    if [[ ! -d "$unarchived_dir" ]]; then return 1; fi

    mv "$unarchived_dir" "$pkg_name"
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
   
    echo "Copying \"$unarchived_dir\" to /opt/"
    sudo mv "$unarchived_dir" "$install_dir"

    # clean
    cd ../..
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
        local pkg_info=$(echo "${packages[$i]}" | sed 's/ //g') # remove spaces
        local pkg_dir="$dir/$(echo "$pkg_info" | cut -d "|" -f 1)"
        local pkg_name=$(echo "$pkg_info" | cut -d "|" -f 2)        
        local source=$(echo "$pkg_info" | cut -d "|" -f 3)
        local url=$(echo "$pkg_info" | cut -d "|" -f 4)
        archive_name="$pkg_name.$source.zip"

        echo -e "\n==================== Installing package $((i+1)) / ${#packages[@]}: \"$pkg_name\"  ===================="

        if [[ $pkg_name == "" || $source == "" ]]; then add_failed_install "$pkg_info"; continue; fi

        # cd to package dir
        cd "$SCRIPT_DIR" || exit
        if ! cd "$pkg_dir"; then echo "No path found"; add_failed_install "$pkg_info"; continue; fi

        # install deb from apt repository
        if [[ $source == "apt" ]]; then
            if [[ -v SKIP_INSTALL_APK ]]; then continue; fi
            if ! install_with_apt_offline "$pkg_name" "$archive_name" "$pkg_info"; then add_failed_install "$pkg_info"; continue; fi

        # install deb from site
        elif [[ $source == "deb" ]]; then
            if [[ -v SKIP_INSTALL_DEB ]]; then continue; fi
            if ! install_deb "$url" "$archive_name" "$pkg_info"; then add_failed_install "$pkg_info"; continue; fi

        # install AppImage
        elif [[ $source == "AppImage" ]]; then
            if [[ -v SKIP_INSTALL_APPIMAGE ]]; then continue; fi
            if ! install_appimage "$url" "$archive_name" "$pkg_info"; then add_failed_install "$pkg_info"; continue; fi

        # install bundle
        elif [[ $source == "bundle" ]]; then
            if [[ -v SKIP_INSTALL_BUNDLE ]]; then continue; fi
            if ! install_bundle "$url" "$archive_name" "$pkg_info"; then add_failed_install "$pkg_info"; continue; fi
        
        # install bin
        elif [[ $source == "bin" ]]; then
            if [[ -v SKIP_INSTALL_BIN ]]; then continue; fi
            if ! install_bin "$url" "$archive_name" "$pkg_info" "$pkg_name"; then add_failed_install "$pkg_info"; continue; fi

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

    # installing
    for i in "${!packages[@]}"; do        
        local pkg_name="${packages[$i]}"

        echo -e "\n==================== Installing library $((i+1)) / ${#packages[@]}: \"$pkg_name\"  ===================="

        if [[ $pkg_name == "" ]]; then add_failed_install "$pkg_name"; continue; fi

        # skip if exist
        if [[ ! -f "$pkg_name.zip" ]]; then echo "Archive not found"; add_failed_install "$pkg_name"; continue; fi

  
        # unachive
        unzip "$pkg_name.zip" -d "$pkg_name.temp"
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
    echo "apt-offline is not installed. Install it first."
    exit
fi


# ------------------------------------------------------------------------------


if [[ ! -v MODE ]]; then
    echo "1. Start Wizard (recomended)"
    echo "2. Download packages"
    echo "3. Install packages offline"
    read -p "Select mode:" MODE
fi

# Create offline package installers
if [[ $MODE == [1] ]]; then 
    create_offline_installers
    exit
fi


# Download packages
if [[ $MODE == [2] ]]; then 
    remove_old_temp_files
    add_repos
    apt update
    download_packages "./" "${soft[@]}"
    download_libs "./LINUX-LIBS/" "${libs[@]}"
    print_result
    exit
fi

# Install packages offline
if [[ $MODE == [3] ]]; then 
    remove_old_temp_files
    install_packages "./" "${soft[@]}"
    install_libs "./LINUX-LIBS/" "${libs[@]}"
    apt install -f -y # fix issues
    print_result
    exit
fi



