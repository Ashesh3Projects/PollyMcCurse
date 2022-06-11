#/bin/bash

# ICO

inkscape -w 16 -h 16 -o pollymc_16.png org.fn2006.PollyMC.svg
inkscape -w 24 -h 24 -o pollymc_24.png org.fn2006.PollyMC.svg
inkscape -w 32 -h 32 -o pollymc_32.png org.fn2006.PollyMC.svg
inkscape -w 48 -h 48 -o pollymc_48.png org.fn2006.PollyMC.svg
inkscape -w 64 -h 64 -o pollymc_64.png org.fn2006.PollyMC.svg
inkscape -w 128 -h 128 -o pollymc_128.png org.fn2006.PollyMC.svg

convert pollymc_128.png pollymc_64.png pollymc_48.png pollymc_32.png pollymc_24.png pollymc_16.png pollymc.ico

rm -f pollymc_*.png

inkscape -w 1024 -h 1024 -o pollymc_1024.png org.fn2006.PollyMC.bigsur.svg

mkdir pollymc.iconset

sips -z 16 16     pollymc_1024.png --out pollymc.iconset/icon_16x16.png
sips -z 32 32     pollymc_1024.png --out pollymc.iconset/icon_16x16@2x.png
sips -z 32 32     pollymc_1024.png --out pollymc.iconset/icon_32x32.png
sips -z 64 64     pollymc_1024.png --out pollymc.iconset/icon_32x32@2x.png
sips -z 128 128   pollymc_1024.png --out pollymc.iconset/icon_128x128.png
sips -z 256 256   pollymc_1024.png --out pollymc.iconset/icon_128x128@2x.png
sips -z 256 256   pollymc_1024.png --out pollymc.iconset/icon_256x256.png
sips -z 512 512   pollymc_1024.png --out pollymc.iconset/icon_256x256@2x.png
sips -z 512 512   pollymc_1024.png --out pollymc.iconset/icon_512x512.png
cp pollymc_1024.png pollymc.iconset/icon_512x512@2x.png

iconutil -c icns pollymc.iconset

rm -f pollymc_*.png
rm -rf pollymc.iconset

for dir in ../launcher/resources/*/scalable
do
    cp -v org.fn2006.PollyMC.svg $dir/launcher.svg
done
