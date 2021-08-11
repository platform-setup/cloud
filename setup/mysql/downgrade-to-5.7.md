Remove current:
sudo apt-get remove mysql-community-server mysql-client mysql-common mysql-community-client mysql-community-client-core mysql-community-server mysql-community-server-core -y
sudo apt-get autoremove

sudo dpkg-reconfigure mysql-apt-config


Ref:
https://www.digitalocean.com/community/questions/how-can-i-properly-downgrade-from-mysql-8-to-5-7-on-ubuntu-20-04
https://subscription.packtpub.com/book/big-data-and-business-intelligence/9781788395809/1/ch01lvl1sec18/downgrading-from-mysql-8-0