#!/bin/bash

usage() {
	echo "Usage : ./build.sh <distro> <options>"
	echo "# Distros compatible :"
	echo "Arch-based/ManJaro-based : arch"
	echo "Debian-based/Ubuntu-based : debian"
	echo "Fedora-based/RedHat-based/CentOS-based : fedora"
	echo "# Options available :"
	echo "Save logs (useful for reporting) : log"
	echo "Do not use 'clear' : noclr"
}

if [ "$1" == "arch" ]; then
	distro="arch"
elif [ "$1" == "debian" ]; then
	distro="debian"
elif [ "$1" == "fedora" ]; then
	distro="fedora"
elif [ "$1" == "help" ]; then
	usage
elif [ "$1" != "arch" ]; then
	usage
	echo "SCRIPT NEEDS ARGUMENTS"
	exit 1
elif [ $1 != "debian" ]; then
	usage
	echo "SCRIPT NEEDS ARGUMENTS"
	exit 1
elif [ $1 != "fedora" ]; then
	usage
	echo "SCRIPT NEEDS ARGUMENTS"
	exit 1
elif [ "$2" == "log" ]; then
	log="true"
	mkdir LOGS
	echo "Logs enabled ! Logs are available in the 'LOGS/' directory"
elif [ "$2" == "noclr" ]; then
	alias clear="echo"
fi


error() {
	echo "FATAL ERROR, PLEASE REPORT : $1" && exit 1
}

welcome() {
	echo "Welcome to "
	echo "This coreboot fork adding features not available upstream, to the MacBook!"
	sleep 2
}

dependencies() {
	clear
	echo "Before we start, we need to download dependencies for coreboot ..."
	sleep 1

	if [ "$log" == "true" ]; then
		if [ "$distro" == "arch" ]; then
			sudo pacman --sync --needed --noconfirm base-devel curl git gcc-ada ncurses zlib > LOGS/Dependencies.log
		elif [ "$distro" == "debian" ]; then
			sudo apt-get install -y bison build-essential curl flex git gnat libncurses5-dev m4 zlib1g-dev > LOGS/Dependencies.log
		else
			sudo dnf install git make gcc-gnat flex bison xz bzip2 gcc g++ ncurses-devel wget zlib-devel > LOGS/Dependencies.log
		fi
	else
		if [ "$distro" == "arch" ]; then
			sudo pacman --sync --needed --noconfirm base-devel curl git gcc-ada ncurses zlib
		elif [ "$distro" == "debian" ]; then
			sudo apt-get install -y bison build-essential curl flex git gnat libncurses5-dev m4 zlib1g-dev
		else
			sudo dnf install git make gcc-gnat flex bison xz bzip2 gcc g++ ncurses-devel wget zlib-devel
		fi
	fi

	if [ "$?" != 1 ]; then
		echo "done!"
	else
		error "Failed to install dependencies !"
	fi
	sleep 1
}

toolchain() {
	clear
	echo "Now, let's build the coreboot toolchain ... This is gonna take a while ..."
	sleep 1

	if [ $log == "true" ]; then
		make crossgcc-i386 CPUS="$(nproc)" > LOGS/Toolchain.log
	else
		make crossgcc-i386 CPUS="$(nproc)"
	fi

	if [ "$?" != 1 ]; then
		echo "done!"
	else
		error "Failed to build toolchain !"
	fi
	sleep 1
}

configure() {
	clear
	echo "Now, let's configure coreboot !"
	echo "Before doing your own configuration, please, at least do the following :"
	echo "-----------------------"
	echo "Mainboard  --->"
	echo "	Mainboard vendor  --->"
	echo "		Apple"
	echo "	Mainboard model  --->"
	echo "		MacBook1,1 or MacBook2,1 (choose the right one, should work with both but is only tested on MacBook2,1)"
	echo "Devices  --->"
	echo "	[*] Use native graphics initialization"
	echo "Payload  --->"
	echo "	Add a payload -->"
	echo "		SeaBIOS or GRUB (only tested with SeaBIOS)"
	echo "Chipset  --->"
	echo "	*** CPU ***"
	echo "	Include CPU microcode in CBFS  --->" 
    echo "		Do not include microcode updates"
	echo "-----------------------"
	sleep 10
	echo "Starting menuconfig ..."
	make menuconfig

	if [ $? != 1 ]; then
		echo "done!"
	else
		error "Failed to configure coreboot !"
	fi
}

build() {
	clear
	echo "Now, everything is ready, now, let's build the actual rom !"
	sleep 1

	if [ "$log" == "true" ]; then
		make  > LOGS/Build.log
	else
		make
	fi

	if [ "$?" != 1 ]; then
		echo "done!"
	else
		error "Failed to compile coreboot !"
	fi
}

finish() {
	echo "Your coreboot rom is now ready ! Enjoy your new firmware !"

	echo "Exiting ..."
	exit 0
}

# RUN ALL OF THIS

welcome
dependencies
toolchain
build
finish

