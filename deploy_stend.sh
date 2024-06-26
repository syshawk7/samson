!#/bin/bash

# Скачиваем и устанавливаем VirtualBox (apt умеет разрешать зависимости)
wget https://download.virtualbox.org/virtualbox/7.0.18/virtualbox-7.0_7.0.18-162988~Ubuntu~noble_amd64.deb -P /tmp/ ; cd /tmp; apt install ./virtualbox-7.0_7.0.18-162988~Ubuntu~noble_amd64.deb -y

# Скачиваем Vagrant, нужен VPN, я скачал пакет, расположил на своей VDS:
#wget https://releases.hashicorp.com/vagrant/2.4.1/vagrant_2.4.1-1_i686.deb -P /tmp/ ; cd /tmp; apt install ./vagrant_2.4.1-1_i686.deb -y
wget ftp://185.232.169.134:2221/vagrant_2.4.1-1_i686.deb -P /tmp/ ; cd /tmp; apt install ./vagrant_2.4.1-1_i686.deb -y

# Скачиваем нужный нам box с debian9 + Vagrantfile
wget ftp://185.232.169.134:2221/debian9.box -P /tmp/
wget ftp://185.232.169.134:2221/Vagrantfile -P /tmp/

# Создаем каталог для проекта, переносим box и Vagrant
vagrantdir=/vagrant_projects/debian9/
mkdir -p $vagrantdir
mv /tmp/debian9.box $vagrantdir
mv /tmp/Vagrantfile $vagrantdir

# Подгружаем бокс, запускаем VM (логин и пароль vagrant - vagrant)
cd $vagrantdir
vagrant box add --name deb9 debian9.box
vagrant up

# необходимые пакеты ставятся с помощью Vagrant provisioner (также правится порт apache2 на 8888)
# проверка через kate
