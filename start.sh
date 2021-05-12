#!/bin/sh

if [ -f "/root/init-script/service_init.py" ]; then
    /usr/bin/python3 /root/init-script/service_init.py > /root/init-script/service_init_out.txt
else
	echo "File /root/init-script/service_init.py is not found!" > /root/init-script/service_init_out.txt
fi

tail -f /dev/null