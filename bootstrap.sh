#!/usr/bin/env bash

sudo apt-get update
# desktop
sudo apt-get install -y lubuntu-desktop
# JDK
sudo apt-get install -y default-jdk
# maven 
sudo apt-get install -y maven
# git
sudo apt-get install -y git
# bootstrapium
cd /home/vagrant/
git clone https://github.com/jvanderwee/bootstrapium.git
chmod +x bootstrapium/
# phantomjs
export PHANTOMJS="phantomjs-1.9.8-linux-x86_64"
wget -N https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOMJS.tar.bz2 -P ~/Downloads
tar xjf ~/Downloads/$PHANTOMJS.tar.bz2 -C ~/Downloads
sudo mv -f ~/Downloads/$PHANTOMJS /usr/local/share/$PHANTOMJS
sudo ln -s /usr/local/share/$PHANTOMJS/bin/phantomjs /usr/local/bin/phantomjs
sudo ln -s /usr/local/share/$PHANTOMJS/bin/phantomjs /usr/bin/phantomjs
# chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install -y google-chrome-stable
# chrome-driver 
wget -N http://chromedriver.storage.googleapis.com/2.12/chromedriver_linux64.zip -P ~/Downloads
unzip ~/Downloads/chromedriver_linux64.zip -d ~/Downloads
chmod +x ~/Downloads/chromedriver
sudo mv -f ~/Downloads/chromedriver /usr/local/share/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
# eclipse
cd ~
export ECLIPSE="eclipse-java-luna-SR1-linux-gtk-x86_64"
wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/luna/SR1/$ECLIPSE.tar.gz
sudo mv $ECLIPSE.tar.gz /opt/
cd /opt/
sudo tar -zxvf $ECLIPSE.tar.gz
sudo touch /usr/share/applications/eclipse.desktop
printf '[Desktop Entry]\nName=Eclipse 4\nType=Application\nExec=/opt/eclipse/eclipse\nTerminal=false\nIcon=/opt/eclipse/icon.xpm\nComment=Integrated Development Environment\nNoDisplay=false\nCategories=Development;IDE;\nName[en]=Eclipse' | sudo tee /usr/share/applications/eclipse.desktop
# sublime text
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install -y sublime-text-installer
# reboot
sudo reboot
startx