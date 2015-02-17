# Install xserver, openbox and chromium-browser
apt-get update
apt-get install xorg openbox chromium-browser

# Create raspberrytv user
user="raspberrytv"
password=$(perl -e 'print crypt("azertyuiop", "password")')
useradd -m -p $password $user

# Allow raspberrytv to run X server
dpkg-reconfigure x11-common

# Exec startx at login
echo 'exec startx' >> /home/raspberrytv/.bashrc

# Exec openbox on xserver launch
echo 'openbox-session' >> /home/raspberrytv/.xinitrc

# Launch Chromium at openbox start
mkdir -p /home/raspberrytv/.config
mkdir -p /home/raspberrytv/.config/openbox
echo 'chromium --kiosk http://192.168.42.192:4567' >> /home/raspberrytv/.config/openbox/autostart
