!#/bin/bash
ip=$(ifconfig|grep 192.168.)
echo ${ip:13:15}
