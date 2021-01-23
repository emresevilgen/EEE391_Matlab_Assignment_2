clc; clear all; close all;

% Get the image file
id = 21602416;
rem = mod(id, 4);
fname = ['image',num2str(rem),'part4.jpg'];
I = imread(fname);

f = [1 0 -1; 2 0 -2; 1 0 -1];
for i = 1:3
    Gx = conv2(f, I(:,:,i));
    Gy = conv2(f', I(:,:,i));
    G(:,:,i) = uint8(sqrt(Gx.*Gx + Gy.*Gy));
end

figure;
imshow(I);
title('I');
drawnow;

figure;
imshow(G);
title('G');
drawnow;