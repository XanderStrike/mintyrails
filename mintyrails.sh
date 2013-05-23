#mintyrails.sh
# Easy ruby + rails installation scipt

# Sets you up with a barebones rails development environment
#  with optional node.js for a runtime.

# Inspired by Josh Frye's Rails Ready
#   https://github.com/joshfng/railsready

# Written by Alex Standke <xanderstrike@gmail.com>
#   https://github.com/XanderStrike/mintyrails

# License: MIT

echo -e "Linux Mint Ruby+Rails installation\n\n"
echo "Here we go!"
cd ~
echo -e "\e[01;32mDownloading package lists...\e[00m"
echo "You may need to enter your password multiple times."
sudo apt-get update


# Basic stuff
echo -e "\e[01;32mInstalling prerequisites...\e[00m"
sudo apt-get -y install wget build-essential clang vim bison openssl zlib1g libxslt1.1 libssl-dev libxslt1-dev libxml2 libffi-dev libyaml-dev libxslt-dev autoconf libc6-dev libreadline6-dev zlib1g-dev libcurl4-openssl-dev libtool
sudo apt-get -y install libsqlite3-0 sqlite3 libsqlite3-dev mysql-client libmysqlclient-dev curl

echo -e "\e[01;32mInstalling Git...\e[00m"
sudo apt-get -y install git-core


# Get ruby/rails bundle set up
echo -e "\e[01;32mInstalling Ruby+Rails via RVM...\e[00m"
curl -L https://get.rvm.io | bash -s stable --autolibs=3 --rails


# Node.js for javascript
echo -e "Install Node.js? [Y/n]\c"
read a
if [[ $a == "N" || $a == "n" ]]; then
	echo "Skipping Node.js"
else
	echo -e "\e[01;32mInstalling node.js...\e[00m"
	sudo apt-get install g++
	git clone https://github.com/joyent/node.git .node
	cd .node
	./configure && make && sudo make install
fi


# Optional Extras
echo -e "Install Imagemagick? [Y/n]\c"
read a
if [[ $a == "N" || $a == "n" ]]; then
	echo "Skipping Imagemagick"
else
	echo -e "\e[01;32mInstalling Imagemagick.\e[00m"
	sudo apt-get -y install imagemagick libmagickcore-dev libmagickwand-dev
fi

echo -e "Generate SSH Keys? [Y/n]\c"
read a
if [[ $a == "N" || $a == "n" ]]; then
	echo "Skipping SSH key generation."
else
	echo -e "\e[01;32mGenerating SSH keys.\e[00m"
	echo -e "Enter Email Address: \c"
	read b
	ssh-keygen -t rsa -C $b
	echo "Key generated, it can be found in ~/.ssh"
fi


echo -e "\e[01;32mInstall completed, you should be good to go.\e[00m"
echo " You may need to set your terminal emulator to run as a login shell, or"
echo " run 'bash --login' to get the rails command to work properly."
# Hurrah
