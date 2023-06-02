# offline-packages-installer

This script will help you create software installation packages that you can re-install offline on a freshly installed Linux system.

The following package sources supported:
- The package name in the `apt` repository. The package and all required dependencies will be downloaded.
- Direct link to the `.deb` package (for example, on the developer's website)
- The link to the archive with binary files
- The link to `AppImange`



### Step1:

- Edit this script `CONFIG` section, add software and libraries you like.

### Step2:

- Create VMWare Virtual Machine, change Network Adapter to `Host Only` mode and install Linux.
`Host Only` mode is needed to prevent updating packages.
- Shut Down virual machine after installing Linux.

### Step3:

- Create `~/Shared` folder on Host machine and place this script there.
- Add `~/Shared` folder to `Virtual Machine Settings > Options > Shared Folders (Always enabled)`.
This folder will be shared between Host and VM.

### Step4:

- Create Virual Machine snapshot.
- Change VM Network Adapter mode to `Nat`.
- Power On virtual machine.

### Step5:

- Run this script on VM at `/mnt/hgfs/Shared/` and select Mode 2 (`Download packages`).
- After downloading you can start script again if somethig wrong. Process will continue, new packages will be downloaded.
- Complete! 

For installing packages offline, just start this script with Mode 3 (`Install packages offline`).

You can add new packages to this script `CONFIG` section and run `Download packages` again at any time for adding new packages. But remember:

**Always download from apt repositories only on fresh installed Linux to include all the necessary dependencies!**

There is no need to download all packages again, only new packages will be downloaded.

You can use environment variables to make the script more subtle. All variables are listed in a comment at the top of the script.
