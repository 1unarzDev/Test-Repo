# Table of Contents
1. [🌟 Getting Started 🚀](#-getting-started-)
2. [Installing Ubuntu 🤓](#installing-ubuntu-)
3. [🌐 Installing Python, Git, and Other Tools 🐍](#-installing-python-git-and-other-tools-)
4. [🐋 Setting Up Docker IMPORTANT 📦](#-setting-up-docker-important-)
5. [Know Your Lingo 📚](#know-your-lingo-)
6. [Early Development Resources 💪](#early-development-resources-)


---


# 🌟 Getting Started 🚀

Sorry for nesting this guide along with other similar code in the GitHub repo. I'm just trying to create a template that can be moved later without any confusion. Also, please let me know if this guide has any issues, I literally wrote the entire thing from memory and a few internet searches.

Anyway, here is a list of tools that will be helpful for development in Roboboat. Most of these can be installed directly from the Docker container (it can be thought of as a package that contains everything needed to run the project). You will have to install Ubuntu, Python, Git, and Docker before being able to anything else. If you are unfamiliar with this stuff, you will be very confused and feel daunted while trying to work with this stuff down the line. There is a useful [Know Your Lingo 📚](#know-your-lingo-) section that you can visit for more details.

Additionally, **please note** be very careful while doing installs, and avoid being overzealous and installing things yourself, thinking that they will be necessary for the future, or skipping steps. Computers are very bad about correcting for these small mistakes and handling these crazy lists of dependencies (which is part of the reason why we use software like Docker).

* **Programmnig Language:** [Python](https://www.python.org/downloads/)
* **OS:** [Ubuntu 22.04](https://www.releases.ubuntu.com/jammy/)
* **Object Detection:** [YOLO](https://docs.ultralytics.com/)
* **Containerization:** [Docker](https://docs.docker.com/: )
* **LiDAR:** [KISS-ICP](https://github.com/PRBonn/kiss-icp?tab=readme-ov-file)
* **Robotic Control Framework:** [ROS2 Humble](https://docs.ros.org/en/humble/index.html)
* **Image Processing:** [OpenCV](https://docs.opencv.org/4.x/index.html)
* **Version Control:** [Git](https://git-scm.com/)
* **Navigation Stack:** [Nav2](https://docs.nav2.org/)
* **Math Operations:** [NumPy](https://numpy.org/doc/stable/)


---


# Installing Ubuntu 🤓

If you are following this guide, I assume that you have access to a personal device that is powerful enough to handle development. If you want to get Ubuntu, there are a dozen people that would install if on your computer if you asked. Otherwise, follow the instructions below or on [this video](https://www.youtube.com/watch?v=mXyN1aJYefc). If you are unsure what you are doing, PLEASE GET HELP. It is extremely easy to completely break your device while going through this process, so you have to be careful.

1. Download the desktop image (.iso file) from the [Canonical website](https://www.releases.ubuntu.com/jammy/)
2. Use a >5GB USB and a software such as [Balena Etcher](https://etcher.balena.io/) to create a bootable USB. Please note that this process will result in the deletion of all of the contents on your flash drive.
3. Make sure that your computer has available space (~100GB ideally), and open the option "Create and format hard disk partitions" in your Windows quick menu.
4. Right click on the largest "Healthy (Primary Partition)" on your computer, click "Shrink Volume," then shrink the partition (I recommend 100,000 MB if you have the space to spair).
5. Click the Windows key, the power option, then the restart button while holding shift.
6. Ideally, your computer has booted into either the UEFI or BIOS menus. From here, find an option labeled like "boot order," or "use device." From here, select your USB flashdrive or move it to the top of the menu. After you save your settings, continue to boot.
7. From GRUB, click try or install Ubuntu. From here, there should be a program that lets you install Ubuntu.
8. After your computer completely installs Ubuntu, reboot your computer (you will likely also be prompted to remove your USB and click enter, don't worry about corrupting it if it asks you to do so). Once you boot up again, you should be in a black menu similar to the one that you saw before when booting into the USB. This menu allows you to boot into either Ubuntu or Windows. In this case, boot into Ubuntu.
9. **If, and only if, your computer has NVIDIA graphics card** (skip past all of these steps if you don't), you will likely have to switch from default Noveau integrated drivers to proprietary NVIDIA drivers to reap the benefits of your card. Start by checking if you have a NVIDIA card in the terminal app by running.
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


**Bonus:** If you like customizing your development environment (especially if you plan to spend a lot of time developing), I recommend that you install customizations to spice up Ubuntu. If you want to speed up the process, then feel free to rice your Ubuntu installation (look it up if you want), but this is generally better suited towards Linux distros like Arch and for people who don't need very specific development environments (which hopefully shouldn't be an issue if you use a venv like Conda or Docker containers). Here is a list of things that I did to improve my Ubuntu.

1. Modify your shell by following a tutorial that has a feel that you like, installing a shell theme (if you get zsh, make sure that you run the zsh script rather than the bash script that is provided), installing extensions like auto-completion, and installing programs like neofetch and adding it to your .bashrc file.
2. Install a cleaner browser like Brave
3. Get a matching wallpaper with your GNOME theme
4. Hide ugly desktop and taskbar icons.
5. Install the GNOME extension manager and find extensions by going to the browse tab and sorting by downloads. (I recommend dash to panel, blur my shell, and user themes)
6. Install GNOME Tweaks, and install a Nerd Font, switch your icon theme to a nicer color like purple, and install a theme like Dracula or Catppuccin (you must have downloaded the user themes extension first before this will work).


---


# 🌐 Installing Python, Git, and Other Tools 🐍

At a minimum, you **need** *Python version 3.10+, Git, Docker, and an IDE of your choice* (VS Code works great for what we are doing). If you ever have issues with depedencies, generally speaking, `sudo dpkg -i --force-overwrite <\file\path\here>` for dpkg-related packages, and `sudo aptitude install <package-name>` after installing it with `sudo apt install aptitude` of course, will allow you to fix dependency errors unless they have a deeper cause. Anyway, here is what you need to do to get the necessary packages.

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
5. Install VS Code
   ```
   wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo gpg --dearmor > microsoft.gpg
   sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/keyrings/microsoft-archive-keyring.gpg sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
   sudo apt install code
   ```
6. The person who developed the Docker Crashcourse container didn't include the proper procedures for a Docker container (i.e. the ROS workspace, dependencies, shell scripts), so you will have to install ROS on your machine for now. This is probably for the best either way. In the future, this stuff will likely already come strapped onto the Docker container🤞 and will be configured so that the packages are cached and only need to be installed once, so you shouldn't have to worry about it. Anyway, **go through [this tutorial](https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debs.html)**. The colcon install will take a while, but don't worry, that is normal.


---


# 🐋 Setting Up Docker IMPORTANT 📦

1. There are two different things that I recommend you install. Firstly, you can install docker by running 'sudo apt install docker.io'. After installing, go through the [Linux Docker Post-Install steps](https://docs.docker.com/engine/install/linux-postinstall/) If you don't do this, then you will have errors. For a GUI version of Docker, download [Docker Desktop](https://docs.docker.com/desktop/install/linux/). Optionally, install the [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#setting-up-nvidia-container-toolkit) to allow Docker to automatically configure your containers to use GPU acceleration.
2. Test your install
   ```sh
   docker run --rm hello-world
   ```
3. Next, you will have to setup an SSH key to clone the GitHub repo (that is private to everyone who isn't part of the organization) The following commands have been taken from [this tutorial](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh). Create an SSH key for your account. Replace the example email with the email that you used to get access to this GitHub repo.
   ```sh
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```
4. Hit enter, continue with the default values, and start an SSH agent by running.
   ```sh
   eval "$(ssh-agent -s)"
   ```
5. Get your private key.
   ```
   ssh-add ~/.ssh/id_ed25519
   ```
6. Then, add your private key by pasting the output of the command (ignore the files that it outputs) into the SSH key section of your GitHub account settings. More instructions are available [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).
7. Just for the purposes of demonstration, clone the crashcourse directory with SSH by running `git clone git@github.com:MHSeals/ROS2-Docker-Crash-Course.git`. This is the general format that you use to clone directories with git by using HTTPS: `git clone https://github.com/example-repo`.
8. Then, go into the directory of the container by using the `cd` command. This command is very useful because it allows you to change the directory of your terminal.
   ```sh
   cd ROS2-Docker-Crash-Course
   ``` 
9. Because you cloned the repo it will have different history than your local repos, so you can't use `git pull-request origin <branch>` to update your repository (which is how you will do it after this step). Instead, you have to run:
   ```sh
   git reset --hard origin/main && git clean -f -d
   ```
10. **Run the container** (if you installed NVIDIA drivers, you should be able to replace "intel" with "nvidia")
   ```
   ./run_container_ubuntu_intel.sh
   ```
11. Run the VRX boat simulation
   ```
   ros2 launch vrx_gz competition.launch.py
   ```
12. If the VRX simulation doesn't work and it outputs something like `vrx_gz not recognized`, then you may need to add the PATH environment variable for the vrx_gz package. You can achieve this by putting the following in your .bashrc file (in your home directory) 
   ```sh
   export GZ_SIM_RESOURCE_PATH= ~/Downloads/ROS2-Docker-Crash-Course/gazebo_vrx_packages# Add vrx path
   . ~/.bashrc # Reload bash
   ```

After installing VS Code, I would recommend that you install the following extensions, **Dev Containers, Docker, Python, Remote Development, Live Share,** and my personal favorite theme is Noctis Uva. After installing those extensions, there should be a new blueish icon in the bottom left corner. Click on the icon, and from the dropdown, select "Attach Running Container" and attach the repository that you cloned earlier. Hopefully you have everything working by this point. Well done.👏


---


# Know Your Lingo 📚

I'm getting worn out writing all of these instructions, so I'm going to laze out and just give you a list of terms that I think are important to learn. I strongly advise you to look up these concepts online (videos are a good resouce). I personally think that [Fireship](https://www.youtube.com/@Fireship) (easy-to-understand programming concepts), [Articulated Robotics](https://www.youtube.com/@ArticulatedRobotics) (ROS and Robotics Specific), [ElectroBOOM](https://www.youtube.com/@ElectroBOOM) (electronics), [3B1B](https://www.youtube.com/@3blue1brown) (underlying mathematics), [MATLAB](https://www.youtube.com/@MATLAB) (algorithms), and [Computer Vision Engineer](https://www.youtube.com/@ComputerVisionEngineer/videos) (Object Detection) are all good YouTube channels for learning about the concepts commonly used in this club. 

As far as using Inventor or Fusion goes (which I sort of doubt you would be this far into Comp Sci while also doing engineering), my advice is that you just practice sketching objects with contraints and parametric modelling techniques. I personally prefer Fusion for its powerful timeline feature and faster modeling workflow, but Inventor is better at bringing together components and providing simulation tools. The UIs may seem a bit daunting at first, but I think that there is absolutely no reason to need massive tutorials other than to get a basic starting point.

On a different note, a lot of programming, particularly autonomous programming, requires a strong understanding (or strong ability to copy and paste lol) of math. If you think that you will be involved in the programming of the underlying logic behind the autonomous navigation, I recommend that you learn some basic **linear algebra** (as in manipulating matrices, nothing fancy), *possibly* **calculus** (for acceleration and PID), **geometry**, particularly **trignometry** (this one is a must), **basic statistics** (if you are interested in error analysis, corrective algorithms, or point cloud grouping), physics (it can be helpful, but you can derive most of the important stuff intuitively), and maybe some discrete mathematics can't hurt (combinatorics, set theory, **big o notation**). If I'm being entirely honest though, most math in programming doesn't get too crazy, so you shouldn't have to worry.  

Here's my lazy dump of vocab terms or tools that I think may be useful (honestly, I wouldn't go out of my way to learn these, they will come over time):
1. Docker Image
2. Docker Container 
3. Dockerfile
4. Topic
5. Publisher
6. Subscriber
7. Computer Vision (CV)
8. Computer Vision Model
9. Training Weights
10. Machine Learning/Deep Learning especially in relation to CNN
11. Proportial Integral Derivative (PID) Control
12. Model Predictive Control (MPC)
13. Inertial Measurement Unit (IMU)
14. You Only Look Once (YOLO)
15. Degrees of Freedom (DOF)
16. Autonomous
17. GitHub Repository
18. GitHub Branch
19. Pull Request
20. Push
21. KISS-ICP
22. TF Tree (TFT)
23. TF2
24. Serialization/Serialized Data Type
25. OpenCV
26. cd command
27. mkdir command
28. sudo keyword
29. apt and dpkg installers
30. Root
31. ROS
32. Bounding Box
33. Yaw
34. Pitch
35. Roll
36. Linear Velocity
37. Angular Velocity
38. Camera Calibration
39. Point Cloud
40. LiDAR
41. SLAM
42. Motor Controller
43. Cube Orange
44. NVIDIA Jetson Nano

---


# Early Development Resources 💪

1. [Git Notes 📁](#git-notes-)
2. [Docker Notes 🐋](#docker-notes-)
3. [ROS Notes 🤖](#ros-notes-)
4. [Quick Jot Notes 📝](#quick-jot-notes-)

Welcome to Early Development! A lot of this stuff is pretty crazy if you are just getting started, but the best way to learn by far is to actually do things. This guide is a sort of notes section where I write down important things that I learned along the way, and put resources for others in the future to further improve upon previous stuff.

[**This is a very comprehensive flowchart of how the robot will ideally function this year.**](https://drive.google.com/file/d/1A_YrRUzLtcq7FW57C36pD_8YOVJtAapV/view?usp=sharing)

### Git Notes 📁

Change git remote url to avoid accidental pushes to base project
   ```sh
   git remote set-url origin github_username/repo_name
   git remote -v # confirm the changes
   ```

### Docker Notes 🐋



### ROS Notes 🤖

This is how you build a ROS project.
   ```
   cd $COLCON_WS && colcon build --symlink-install --packages-select <word-dir-here> && . install/setup.bash
   ```

### Quick Jot Notes 📝