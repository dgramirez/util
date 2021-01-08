# C++20 Utilities via Modules
This is a project designed to create a cross-platform toolset divided into modules using C++20 Modules. Currently, This project will support Windows and Linux. Below will explain how to I setup my environment so I can use the modules created.

## Prerequisites
### C++20 Compatible Compiler
###### [MS]VC++ (v. 14.28+)
This compiler can be downloaded by downloading the latest Visual Studio installer from the microsoft website. Make sure it is the latest version and you get the Desktop Development with C++ component.

###### GCC (v 11+)
As of typing this README.md, the release version of GCC (10.2) does not support C++20 Modules. However, you can clone the GCC development repository and build GCC from source. Here are two resources along with the commands I've done to build the development version of GCC.

`Source: https://gcc.gnu.org/wiki/cxx-modules`  

First thing i've done is download the prerequisites needed to build GCC. Source Here:  
`Requirements: https://gcc.gnu.org/install/prerequisites.html`

Next I did the following:
```
git clone --branch devel/c++-modules git://gcc.gnu.org/git/gcc.git SRCDIR
mkdir objdir
cd objdir
../SRCDIR/configure --prefix=$HOME/gcc --enable-languages=c,c++,objc,obj-c++ --disable-multilib
make #-j #(Use if using multi-core processor. Take a long while.)
make install
```

After the `make install` command, GCC should be created in your home directory in the gcc directory. Use the executable in from directory over the preinstalled GCC.

One final thing that should be adjusted is the `$LD_LIBRARY_PATH` environment variable. By default, ld will look in the default path `(eg. /usr/lib/x86_64-linux-gnu)` which may cause problems with build2. Simply prepend the GCC lib64 directory to the `$LD_LIBRARY_PATH`. I did this in my bashrc:

```
/home/user/.bashrc
...
#Prepend GCC Library Path
export LD_LIBRARY_PATH=/home/user/gcc/lib:/home/user/gcc/lib64:$LD_LIBRARY_PATH
...
```

### Build2
Build2 is a build toolchain designed with convenience in mind for packaging and developing c++ projects. This will be used for building the unit test. If you don't wish to run (or contribute) to the unit tests, this can be skipped.

###### MSVC
Simply follow the instructions provided by the build2 installation page.  
`Build2 Installation Page: https://build2.org/install.xhtml#windows-msvc`

###### GCC 11 (devel)

As of this writing, there will be a script (build-gcc11-dev.sh) which would attempt to build the project directly. This will change when either an official release of GCC releases version 11 or the Development build is able to compile with the flag `-fdirectives-only`. If anyone knows how to remove that flag from Build2 please e-mail me at dgramirez@protonmail.com and I will gladly un-strike the directions below. Until then, read over the script and if you feel comfortable that it won't expose your machine, execute it.

~~As of typing this README.md, the GCC 10.2 will not be able to compile the project. Due to this, the user must build GCC Development Branch from source and link that to Build2 Installation.~~

~~Follow this Installation page below.~~  
`Build2 Installation Page: `

~~Once you reach the install part of the command you must append one option:~~  
`--cxx /path/to/g++`

~~eg.~~
```
sh build2-install-0.13.0.sh --cxx /path/to/g++
```

~~If Build2 fails due to not finding GLIBCXX_3.4.xx, this is because the ld command is looking at the default library path. Read the last paragraph of the Compiler Section (with GCC) to fix this issue.~~

## Modules

### test.mxx
A temporary module which provides a print function, primarily to print "Hello, World" on the console. Designed to be imported into a project to make sure the module support works. Will be removed once Unit Testing is ready.