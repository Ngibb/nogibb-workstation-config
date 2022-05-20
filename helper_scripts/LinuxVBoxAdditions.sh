su -c "apt-get install -y vim"
su -c "/usr/sbin/usermod -a -G sudo ${USER}"

su -c "apt install dkms linux-headers-$(uname -r) build-essential"
su -c "mount /dev/cdrom /mnt"

su -c "sh /mnt/VBoxLinuxAdditions.run"

echo "Make sure to reboot and give the VM more resources. Think will also take care of logout/login for sudo."
