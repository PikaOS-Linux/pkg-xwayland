# Clone Upstream
git clone https://gitlab.freedesktop.org/xorg/xserver.git ./xwayland -b xwayland-23.2.1
cp -rvf ./debian ./xwayland/
cd ./xwayland

# Get build deps
apt upgrade -y
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p xwayland_23.2.1
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
