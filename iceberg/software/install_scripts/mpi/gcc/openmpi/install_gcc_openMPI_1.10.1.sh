#!/bin/bash

# This is a template script for building and installing software on iceberg.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################

############################## Variable Setup ################################
version=1.10.1
build_dir=/scratch/$USER/openmpi_$version
prefix=/usr/local/mpi/gcc/openmpi/$version

filename=openmpi-$version.tar.gz
baseurl=http://www.open-mpi.org/software/ompi/v1.10/downloads/

# Set this to 'sudo' if you want to create the install dir using sudo.
sudo='sudo'


##############################################################################
# This should not need modifying
##############################################################################

# Create the build dir

if [ ! -d $build_dir ]
then
    mkdir -p $build_dir
fi

cd $build_dir

# Create the install directory
if [ ! -d $prefix ]
then
   $sudo mkdir -p $prefix
   $sudo chown $USER:app-admins $prefix
fi 

# Download the source
if [ -e $filename ]                                               
then                                                                            
  echo "Install tarball exists. Download not required."                         
else                                                                            
  echo "Downloading source" 
  wget $baseurl/$filename
fi

##############################################################################

##############################################################################
# Installation (Write the install script here)
##############################################################################

tar -xzf openmpi-$version.tar.gz
cd openmpi-$version

./configure --prefix=$prefix
make -j16
make check
make install

