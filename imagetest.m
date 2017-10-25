[fname, path] = uigetfile('*.*','inter an image');
subplot(2,2,1);
im = imread(fname);
%% read the image form the file
%%J = imresize(im, 0.1);
%%resize the image 
%%H=rgb2gray(J);
imshow(im);
title('orignal');
imR = im;
imR(:,:,2:3)=0;
subplot(2,2,2)
imshow(imR);
title('red part');

imG = im;
imG(:,:,1:2:3)=0;
subplot(2,2,3)
imshow(imG);
title('green part');

imB = im;
imB(:,:,1:2)=0;
subplot(2,2,4)
imshow(imB);
title('blue part');
% rather than making others channel
imR1=im(:,:,1);
imG1=im(:,:,2);
imB1=im(:,:,3);
figure;
subplot(3,1,1);
imshow(imR1);
title('red part');

subplot(3,1,2);
imshow(imG1);
title('red part');

subplot(3,1,3);
imshow(imB1);
title('blue part');