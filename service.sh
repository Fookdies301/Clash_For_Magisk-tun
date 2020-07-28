#!/system/bin/sh

(
until [ $(getprop sys.boot_completed) -eq 1 ] ; do
  sleep 5
done
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
)&