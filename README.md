
Basic snort container.

Usage:

```
docker run cybermaggedon/snort:latest \
  snort -i eth0 -A unsock -N -l /var/log/snort/ -c /etc/snort/snort.conf

```

