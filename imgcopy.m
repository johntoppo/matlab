rpi = raspi();
openShell(rpi);
getFile(rpi,'/usr/share/pixmaps/debian-logo.png');
img = imread('debian-logo.png');
image(img);

