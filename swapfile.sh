# This script will add a swapfile to an existing VPS installation of Vultr

dd if=/dev/zero of=/swapfile count=2048 bs=1M
chmod 600 /swapfile
chown root:root /swapfile
mkswap /swapfile
swapon /swapfile

# Add swapfile to fstab
sed -i '$a\/swapfile   none    swap    sw  0   0' /etc/fstab
