#!/bin/bash

HOME_DIR=$1

# Set apt-get for non-interactive mode
export DEBIAN_FRONTEND=noninteractive

# Update all the things.
apt-get -y -qq update && apt-get -y -qq upgrade

# dependencies
apt-get -y install python-pip python-setuptools libjpeg-turbo8-dev libfreetype6-dev zlib1g-dev liblcms2-dev liblcms-utils libtiff5-dev python-dev libwebp-dev apache2 libapache2-mod-wsgi wget git build-essential zip
pip install Pillow configobj requests mock responses

# kakadu
cd $HOME_DIR/loris/tmp
KDU_PKG=KDU78_Demo_Apps_for_Linux-x86-64_160226
if [ ! -f $KDU_PKG.zip ]; then
  wget http://kakadusoftware.com/wp-content/uploads/2014/06/$KDU_PKG.zip
fi
if [ ! -d $KDU_PKG ]; then
	unzip $KDU_PKG.zip
fi
cp $KDU_PKG/kdu* /usr/local/bin/
cp $KDU_PKG/libkdu*.so /usr/local/lib
ln -s /usr/local/lib/libkdu*.so /usr/local/lib/libkdu.so
ldconfig

# loris
useradd loris -m
if [ ! -d loris ]; then
  git clone https://github.com/loris-imageserver/loris.git
fi
cd loris
./setup.py install  --source-images $HOME_DIR/loris/images

# apache config
cp $HOME_DIR/loris/install/001-loris.conf /etc/apache2/sites-enabled/
echo "Listen 5004" >> /etc/apache2/ports.conf
a2enmod headers expires
service apache2 restart
