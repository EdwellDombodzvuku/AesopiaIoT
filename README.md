This is a simple cloud home surveillance camera project that uses the new Raspberry Pi Zero W single board computer. It uses a MODMYPI enclosure that fits the board and the camera. A wall mount is also included. The software should work with any Raspberry PI version, but the MODMYPI is made specifically for the PI Zero W platform.

The goal of this project is to provide an easy way to setup a basic cloud camera at the lowest possible cost.

**Features**

* Motion detection
* Integrated with Dropbox for motion detected clips storage (MP4 format)
* Simple step-by-step installation wizard
* Live streaming in the desktop/mobile browser with remote access capabilities
* Authentication for live stream visualization
* 3D printed enclosure
* Ability to create several integrations using IFTTT (ex: If Pigeon's dropbox folder changes, send an e-mail, SMS, or slack message including the clip file link).
* Automatically deletes locally recorded clips after uploading to Dropbox
* Self-contained modular system for easily creating new modules

**Requirements**
* (optional) MODMYPI enclosure 
* A Rasberry Pi Zero W running Raspbian and connected to the internet. The regular (no-wifi) Raspberry PI Zero also works, but will require a usb wifi doongle that will stay out of the designed enclosure
* A Raspberry Pi camera with cable
* (optional) A long micro-usb power cable


## Getting started

Connect to your Raspberry PI using SSH or using a monitor. Make sure you have the Raspberry PI camera already working, You can test using the following command:

```bash
raspistill -o cam.jpg
```

If camera is not working, make sure it's activated in the setup (option 5):
```bash
sudo raspi-config
```

If you have problems, check: https://www.raspberrypi.org/documentation/configuration/camera.md

Now, clone this repository using git (recommended) in the root of your Raspberry PI home directory:

```bash
cd /home/pi
git clone https://github.com/edwelldombodzvuku/aesopiaIoT.git
cd pigeon
```

When ready, give execution permission to the setup script and run it:

```bash
 chmod +x aesopia_install.sh
 ./aesopia_install.sh
```

The installation should take about 10-15 minutes and inputs from you will be necessary towards the process (ex: Dropbox configuration)

## After Installation

After the installation is completed, you will be able to watch the camera live feed by accessing:

```
http://[PI-ADDRESS]:[8099]
```

If you want to setup remote access, make sure to setup port forwarding in your modem admin panel (port 8099 to your Raspberry IP.)

If everything went fine, you will start seeing MP4 clips being saved on your Dropbox folder when motion events are triggered.

If you want to start at boot, edit the systemd file as following:
```Bash
sudo nano /etc/systemd/system.conf
```
Add the following command below the comment then save the file and exit

```
[Unit]
Description=aesopia
After=network.target

[Service]
ExecStart=motion -c /home/pi/aesopia/aesopia.conf
Restart=on-abort

[Install]
WantedBy=multi-user.target
```

To finalize, make sure you are using the right timezone, so the camera clips date will make sense to you.

```
sudo raspi-config
Select: Internationalisation Options

```

## Issues

If you are getting the "Unable to open video device" grey screen, you can try:

Install Motion again directly from the repository:

```wget https://github.com/Motion-Project/motion/releases/download/release-4.0.1/pi_jessie_motion_4.0.1-1_armhf.deb dpkg -i pi_jessie_motion_4.0.1-1_armhf.deb```



## Current stage

This project is early stage and we looking for contributors. You can edit the ```aesopia.conf``` file to change default configurations and make it more suitable for your needs.


## This project uses code from the following repositories:
* [Motion-Project](https://github.com/Motion-Project/motion)
* [Dropbox-Uploader](https://github.com/andreafabrizi/Dropbox-Uploader)
* [Pigeon Open-Source Cloud Camera](https://github.com/geraldoramos/pigeon)

