#!/bin/bash



read -p "Ingresa la contraseña para adminBD: " adminBDContra
read -p "Ingresa la contraseña para adminSW: " adminSWContra

useradd -m -s /bin/bash adminBD
useradd -m -s /bin/bash adminSW

echo -e "$adminBDContra\n$adminBDContra" | passwd adminBD
echo -e "$adminSWContra\n$adminSWContra" | passwd adminSW

apt-get update
apt-get install -y apache2 mysql-server php libapache2-mod-php vsftpd


cp /media/pendrive/scripts $HOME
chown -R $USER:$USER $HOME/scripts

sudo systemctl restart apache2
sudo systemctl restart mysql
sudo systemctl restart vsftpd

echo "Configuración completa. Usuarios creados, servicios instalados y scripts movidos."
