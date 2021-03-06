#!/bin/bash -e

module purge

version=3.140609
install_dir=/usr/local/packages6/apps/gcc/4.4.7/ctffind/$version

rm -rf /scratch/te1st/ctffind
mkdir -p /scratch/te1st/ctffind
cd /scratch/te1st/ctffind

wget http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/ctf_140609.tar.gz -O ctf_latest.tar.gz
tar -xzf ctf_latest.tar.gz

cd ctf
make -f Makefile_linux_mp
make -f Makefile_linux

cp -p ctf*.exe $install_dir



