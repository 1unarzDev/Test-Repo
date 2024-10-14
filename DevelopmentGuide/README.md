## Table of Contents
1. [🌟 Getting Started 🚀](#-getting-started-)
2. [Installing Ubuntu 🤓](#installing-ubuntu-)
3. [🌐 Installing Python, Git, and Other Tools 🐍](#-installing-python-git-and-other-tools-)
4. [🐋 Setting Up Docker IMPORTANT 📦](#-setting-up-docker-important-)
5. [Know Your Lingo 📚](#know-your-lingo-)
6. [Early Development Resources 💪](#early-development-resources-)

---

## 🌟 Getting Started 🚀

Sorry for nesting this guide along with other similar code in the GitHub repo. I'm just trying to create a template that can be moved later without any confusion. Also, please let me know if this guide has any issues, I literally wrote the entire thing from memory and a few internet searches.

Anyway, here is a list of tools that will be helpful for development in Roboboat. Most of these can be installed directly from the Docker container (it can be thought of as a package that contains everything needed to run the project). You will have to install Ubuntu, Python, Git, and Docker before being able to anything else.

* **Programmnig Language:** [Python](https://www.python.org/downloads/)
* **OS:** [Ubuntu 22.04](https://www.releases.ubuntu.com/jammy/)
* **Object Detection:** [YOLO](https://docs.ultralytics.com/)
* **Containerization:** [Docker](https://docs.docker.com/: )
* **LiDAR:** [KISS-ICP](https://github.com/PRBonn/kiss-icp?tab=readme-ov-file)
* **Robotic Control Framework:** [ROS2 Humble](https://docs.ros.org/en/humble/index.html)
* **Computer Vision:** [OpenCV](https://docs.opencv.org/4.x/index.html)
* **Version Control:** [Git](https://git-scm.com/)
* **Navigation Stack:** [Nav2](https://docs.nav2.org/)
* **Math Operations:** [NumPy](https://numpy.org/doc/stable/)

---

## Installing Ubuntu 🤓

If you are following this guide, I assume that you have access to a personal device that is powerful enough to handle development. If you want to get Ubuntu, there are a dozen people that would install if on your computer if you asked. Otherwise, follow the instructions below or on [this video](https://www.youtube.com/watch?v=mXyN1aJYefc). If you are unsure what you are doing, PLEASE GET HELP. It is extremely easy to completely break your device while going through this process, so you have to be careful.

1. Download the desktop image (.iso file) from the [Canonical website](https://www.releases.ubuntu.com/jammy/)
2. Use a >5GB USB and a software such as [Balena Etcher](https://etcher.balena.io/) to create a bootable USB. Please note that this process will result in the deletion of all of the contents on your flash drive.
3. Make sure that your computer has available space (~100GB ideally), and open the option "Create and format hard disk partitions" in your Windows quick menu.
4. Right click on the largest "Healthy (Primary Partition)" on your computer, click "Shrink Volume," then shrink the partition (I recommend 100,000 MB if you have the space to spair).
5. Click the Windows key, the power option, then the restart button while holding shift.
6. Ideally, your computer has booted into either the UEFI or BIOS menus. From here, find an option labeled like "boot order," or "use device." From here, select your USB flashdrive or move it to the top of the menu. After you save your settings, continue to boot.
7. From GRUB, click try or install Ubuntu. From here, there should be a program that lets you install Ubuntu.
8. After your computer completely installs Ubuntu, reboot your computer (you will likely also be prompted to remove your USB and click enter, don't worry about corrupting it if it asks you to do so). Once you boot up again, you should be in a black menu similar to the one that you saw before when booting into the USB. This menu allows you to boot into either Ubuntu or Windows. In this case, boot into Ubuntu.
9. If your computer has NVIDIA graphics card, you will likely have to switch from default Noveau integrated drivers to proprietary NVIDIA drivers to reap the benefits of your card. Start by checking if you have a NVIDIA card in the terminal app by running.
   ```sh
   lspci -k | grep -A 2 -i "VGA"
   ```
10. Find the appropriate drivers to install (it will be labeled as "recommended") While you are using Linux, you may notice the key-word "sudo" being used a lot. "sudo" is just a keyword that allows the command to be run using admin permissions, otherwise known as being "root."
   ```sh
   sudo ubuntu-drivers devices
   ```
11. Install the drivers (replace num with the one that was recommended). Another common Linux command, "apt" or "apt-get" is a package manager that is used to install programs. ALWAYS use this (or dpkg and aptitude) as opposed to snap.
   ```sh
   sudo apt-get install nvidia-<num>
   ```
12. If you still have secure boot on, it will prompt you to set a key to protect against attackers. Set it to something random that you can remember.  
13. Reboot
   ```sh
   sudo reboot
   ```
14. You will boot into a new menu that you haven't seen before. Select the second option that asks you to validate a key. Enter your key (If I am remembering correctly, it won't show on-screen, similar to when typing in your password for root.) Once you validate the key and save your settings, you should be able to reboot. After booting, check that everything has worked correctly by opening settings→about and checking that the graphics is delegated to your NVIDIA GPU rather than integrated graphics.

---

## 🌐 Installing Python, Git, and Other Tools 🐍

At a minimum, you need Python version 3.10+, Git, Docker, and an IDE of your choice (VS Code works great for what we are doing). If you ever have issues with depedencies, generally speaking, `sudo dpkg -i --force-overwrite <\file\path\here>` for dpkg-related packages, and `sudo aptitude install <package-name>` after installing it with `sudo apt install aptitude` of course, will allow you to fix dependency errors unless they have a deeper cause. Anyway, here is what you need to do to get the necessary packages.

1. Update your packages
   ```sh
   sudo apt update
   ```
2. Install Python
   ```sh
   sudo apt install python
   ```
3. Install Git
   ```sh
   sudo apt install git
   ```
4. Install Terminator
   ```
   sudo apt-get install terminator
   ```
5. Install VS Code (If you want)
   ```
   wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo gpg --dearmor > microsoft.gpg
   sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/keyrings/microsoft-archive-keyring.gpg sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
   sudo apt install code
   ```

---

## 🐋 Setting Up Docker IMPORTANT 📦

6. After installing VS Code, I would recommend that you install the following extensions, **Dev Containers, Docker, Python, Remote Development, Live Share,** and my personal favorite theme is Noctis Uva. After installing those extensions, there should be a new blueish icon in the bottom left corner. Click on the icon, and from the dropdown, select "Attach Running Container"

---

## Know Your Lingo 📚

---

## Early Development Resources 💪

5. Change git remote url to avoid accidental pushes to base project
   ```sh
   git remote set-url origin github_username/repo_name
   git remote -v # confirm the changes
   ```