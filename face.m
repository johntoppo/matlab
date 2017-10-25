clc
[filename folder] = uigetfile( {'*.jpg'; '*.bmp';'*.png'},'File selector');
fullfilename = fullfile(folder, filename);
A = imread(fullfilename);
%%y= rgb2gray(A);
%%bw=im2bw(y);
%x=gray2bw(y);
FaceDetector = vision.CascadeObjectDetector();
FaceDetector.MergeThreshold = 4;
BBOX = step (FaceDetector, A);
B = insertObjectAnnotation(A, 'rectangle', BBOX, 'Face');
imshow(B), title('Detected Faces');

n=size(BBOX, 1);
str_n = num2str(n);
str = strcat('Number of detected faces are ', str_n);
disp(str);

%for i= 1 : size(B,1)
 %   rectangle('Position',B(i,:), 'LineWidth', 3, 'LineStyle','-', 'EdgeColor', 'r');
%end
for i = 1 : size(BBOX, 1)
    j = imcrop(A, BBOX(i, :));
    figure(2);
    subplot(6, 6, i);
    imshow(j);
end  

