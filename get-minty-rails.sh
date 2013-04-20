
echo "Linux Mint Ruby+Rails installation\n\n"
echo "Sets you up with a barebones rails development environment"
echo -e " with node.js for a runtime.\n\n"

echo "Most of this stolen from Josh Frye's Rails Ready"
echo -e "		https://github.com/joshfng/railsready\n\n"

echo -e "Modified by Alex Standke\n\n"

echo "Here we go!"

cd ~

echo -e "\e[01;32mInstalling prerequisites...\e[00m"

pm="apt-get"
sudo $pm -y install \
    wget curl build-essential clang \
    g++ vim \
    bison openssl zlib1g \
    libxslt1.1 libssl-dev libxslt1-dev \
    libxml2 libffi-dev libyaml-dev \
    libxslt-dev autoconf libc6-dev \
    libreadline6-dev zlib1g-dev libcurl4-openssl-dev \
    libtool >> $log_file 2>&1

sudo $pm -y install libsqlite3-0 sqlite3 libsqlite3-dev libmysqlclient-dev >> $log_file 2>&1


echo -e "\e[01;32mInstalling Git...\e[00m"
sudo $pm -y install git-core >> $log_file 2>&1

echo -e "\e[01;32mInstalling Ruby+Rails via RVM...\e[00m"
curl -L https://get.rvm.io | bash -s stable --autolibs=3 --rails

echo -e "\e[01;32mInstalling node.js for javascript...\e[00m"
git clone https://github.com/joyent/node.git .node
cd .node
git checkout v0.6.18 #Try checking nodejs.org for what the stable version is
./configure && make && sudo make install

echo -e "\e[01;32mInstall completed, you should be good to go.\e[00m"
echo " You may need to set your terminal emulator to run as a login shell, or"
echo " run 'bash --login' to get it to work though. Annoying."