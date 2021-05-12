#!/bin/sh

if [ -f "/root/service_init.py" ]; then
    /usr/bin/python3 /root/service_init.py > service_init_out.txt
else
	echo "File /root/service_init.py is not found!" > service_init_out.txt
fi

tail -f /dev/null