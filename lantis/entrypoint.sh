if [ -f "/keys/ssh_host_rsa_key" ]; then cp  /keys/ssh_host_rsa_key /etc/ssh/
else
	ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && cp /etc/ssh/ssh_host_rsa_key /keys
fi
if [ -f "/keys/ssh_host_dsa_key" ]; then cp  /keys/ssh_host_dsa_key /etc/ssh/
else
	ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa && cp /etc/ssh/ssh_host_dsa_key /keys
fi
if [ -f "/keys/ssh_host_ecdsa_key" ]; then cp  /keys/ssh_host_ecdsa_key /etc/ssh/
else
	ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa -b 521 && cp /etc/ssh/ssh_host_ecdsa_key /keys
fi
if [ ! -f "/keys/lantis.key" ]; then ssh-keygen -f /keys/lantis.key -N '' -b 2048; fi
cp -f /keys/lantis.key* /lantis/
if [ ! -f "/keys/setup.key" ]; then ssh-keygen -f /keys/setup.key -N '' -b 2048; fi
cp -f /keys/setup.key* /lantis/

echo '########################################################'
echo '# Public Key for adding new hosts ######################'
echo '########################################################'
cat /lantis/setup.key.pub || exit 7
echo '########################################################'
echo ''
echo '########################################################'
echo '# LANTIS Key for data transport ########################'
echo '########################################################'
cat /lantis/lantis.key.pub || exit 7
echo '########################################################'
echo ''
mkdir -p /root/.ssh/ || exit 7
touch /root/.ssh/authorized_keys || exit 7

cd /lantis  || exit 3

if grep -Fxq "$(cat setup.key.pub)" /root/.ssh/authorized_keys
then
	echo "Setup  Key Present"
else
	echo "$(cat setup.key.pub)" >> /root/.ssh/authorized_keys || exit 7
	echo "Setup key installed"
fi

/usr/sbin/sshd -D -E /lantis/lantis.log &

/wait || exit 10
touch lantis.log && bash ./lantis.bash -L || exit 3;
tail -f /lantis/lantis.log;



