# Coreboot, modified for better macbook21 support

This fork is for making the macbook21 support better.

For instance, a C3-State has been added in this fork and is fully functionnal

Links :

- [Original README](./ORIGINALREADME.md)
- [Patches used](./patches/)

### Build

For building the rom, you can do it [the official way](https://doc.coreboot.org) but it's recommended to use the script provided in the repo :

	./build.sh <distro> <option>

For example, if you use Ubuntu and want to save logs, you would run :

	user@host:/path/of/coreboot$ ./build.sh debian log

for more information about how to use the script:

	user@host:/path/of/coreboot$ ./build.sh help

### Issues

If you ran into an issue or bug, before reporting it, please read the [following](https://github.com/Vitali64GitHub/coreboot-macbook21-mod/issues/1)


