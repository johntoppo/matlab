
rpi = raspi();
led = rpi.AvailableLEDs{1};
for i = 1:10
    writeLED(rpi, led, 0);
    pause(0.5);
    writeLED(rpi, led, 1);
    pause(0.5);
end