# offline-packages-installer

This script will help you create software installation packages that you can re-install offline on a freshly installed Linux system.

The following package sources supported:
- The package name in the `apt` repository. The package and all required dependencies will be downloaded.
- Direct link to the `.deb` package (for example, on the developer's website)
- The link to the archive with binary files (compiled app or installer)
- The link to `AppImange`


To download programs with all dependencies, you need to run this script on a freshly installed system that hasn't been updated with packages or installed any programs yet.
Only in this way will you get programs with all the libraries that can be installed offline.

However, you can also use this script to quickly install all the necessary software on any system, not necessarily fresh. But keep in mind that in this case, the program archives will only have dependencies necessary for the current state of the system and will not be suitable for a freshly installed system.

Edit the list of programs you need in this script and run it. The script will prompt you to download  packages or install already downloaded ones. There is also an interactive wizard that will help you properly download packages with all the necessary dependencies using a fresh system in a virtual machine.

**Always download from apt repositories only on fresh installed Linux to include all the necessary dependencies!**

You can use environment variables to make the script more subtle. All variables are listed in the comments at the top of the script.
