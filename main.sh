# Clone Upstream
git clone https://gitlab.freedesktop.org/xorg/xserver.git -b xwayland-23.1.2
cp -rvf ./debian ./xserver
mv ./xserver ./xwayland
cd ./xwayland

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p xwayland_23.1.2
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
