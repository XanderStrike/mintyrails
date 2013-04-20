
echo "Linux Mint Ruby+Rails installation\n\n"
echo "Sets you up with a barebones rails development environment"
echo -e " with node.js for a runtime.\n\n"

echo "Most of this stolen from Josh Frye's Rails Ready"
echo -e "		https://github.com/joshfng/railsready\n\n"

echo -e "Modified by Alex Standke\n\n"

echo "Here we go!"

cd ~

echo -e "\e[01;32mInstalling prerequisites...\e[00m"

sudo apt-get -y install wget curl build-essential clang g++ vim bison openssl zlib1g libxslt1.1 libssl-dev libxslt1-dev libxml2 libffi-dev libyaml-dev libxslt-dev autoconf libc6-dev libreadline6-dev zlib1g-dev libcurl4-openssl-dev libtool
sudo apt-get -y install libsqlite3-0 sqlite3 libsqlite3-dev mysql-client libmysqlclient-dev


echo -e "\e[01;32mInstalling Git...\e[00m"
sudo apt-get -y install git-core


echo -e "\e[01;32mInstalling Ruby+Rails via RVM...\e[00m"
curl -L https://get.rvm.io | bash -s stable --autolibs=3 --rails


# Node.js
echo -e "Install Node.js [Y/n]\c"
read a
if [[ $a == "N" || $a == "n" ]]; then
	echo "Skipping Node.js"
else
	echo -e "\e[01;32mInstalling node.js...\e[00m"
	git clone https://github.com/joyent/node.git .node
	cd .node
	git checkout v0.6.18 #Try checking nodejs.org for what the stable version is
	./configure && make && sudo make install
fi


# Extras

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
	sudo apt-get install xclip
	xclip -sel clip < ~/.ssh/id_rsa.pub
	echo "Key generated and placed in the clipboard."
fi


echo -e "\e[01;32mInstall completed, you should be good to go.\e[00m"
echo " You may need to set your terminal emulator to run as a login shell, or"
echo " run 'bash --login' to get it to work though. Annoying."