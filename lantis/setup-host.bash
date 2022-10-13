if [ ! -f "/keys/lantis.key" ]; then ssh-keygen -f /keys/lantis.key -N '' -b 2048; fi
cp /keys/lantis.key* /lantis/
if [ ! -f "/keys/setup.key" ]; then ssh-keygen -f /keys/setup.key -N '' -b 2048; fi
cp /keys/setup.key* /lantis/

echo '########################################################'
echo '# Public Key for adding new hosts ######################'
echo '########################################################'
cat /keys/setup.key.pub || exit 7
echo '########################################################'
echo '# LANTIS Key for data transport ########################'
echo '########################################################'
cat /keys/lantis.key.pub || exit 7
echo '########################################################'

mkdir -p /root/.ssh/ || exit 7
touch /root/.ssh/authorized_keys || exit 7

if grep -Fxq "$(cat /keys/lantis.key.pub)" /root/.ssh/authorized_keys
then
	echo "LANTIS Key OK"
else
	echo "$(cat /keys/lantis.key.pub)" >> /root/.ssh/authorized_keys || exit 7
	echo "LANTIS key installed"
fi

