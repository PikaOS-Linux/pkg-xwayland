# Clone Upstream
#git clone https://gitlab.freedesktop.org/xorg/xserver.git -b xwayland-23.2.2 ./xwayland
git clone https://gitlab.freedesktop.org/ekurzinger/xserver.git -b explicit-sync ./xwayland
cp -rvf ./debian ./xwayland/
cd ./xwayland
for i in $(cat ../patches/series) ; do echo "Applying Patch: $i" && patch -Np1 -i ../patches/$i || bash -c "echo "Applying Patch $i Failed!" && exit 2"; done

# Get build deps
apt upgrade -y
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
