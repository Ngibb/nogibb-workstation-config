su -c "/usr/sbin/usermod -a -G sudo ngibb"

sudo apt install dkms linux-headers-$(uname -r) build-essential
sudo mount /dev/cdrom /mnt

sudo sh /mnt/VBoxLinuxAdditions.run

echo "Make sure ot reboot and give the VM more resources"
