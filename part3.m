clc; clear all; close all;

% Get the image file
imgray = imread('gray.jpg');
n = size(imgray, 1);
m = size(imgray, 2);

% Part 3.b
gaussnoise = 8*randn(n, m);
imgaussnoise = uint8(double(imgray) + gaussnoise);
figure;
imshow(imgaussnoise, [0 255]);
title('Corrupted image at Part 3.b');
drawnow;

% Part 3.c
Ms = [9 25 121];
displayForMs(Ms, imgaussnoise, '3.c');

% Part 3.d
gaussnoise = 32*randn(n, m);
imgaussnoise = uint8(double(imgray) + gaussnoise);
figure;
imshow(imgaussnoise, [0 255]);
title('Corrupted image at Part 3.d');
drawnow;

Ms = [9 25 121];
displayForMs(Ms, imgaussnoise, '3.d');

% Part 3.e
imsaltnoise = imgray;
noisypixels = rand( size(imgray,1), size(imgray,2) );
imsaltnoise(noisypixels <= (1 / 16)) = 255;
imsaltnoise(noisypixels >= (15 / 16)) = 0;
figure;
imshow(imsaltnoise, [0 255]);
title('Salt and pepper type noise at Part 3.e');
drawnow;

% Part 3.f
Ms = [9 25 121];
displayForMs(Ms, imsaltnoise, '3.f');


function displayForMs(Ms, image, part)
    for i = 1: size(Ms, 2)
        J = medianfilter(Ms(1, i), image);
        figure;
        imshow(J, [0 255]);
        tit_str = ['M = ', num2str(Ms(1, i)), ' at Part ', part];
        title(tit_str);
        drawnow;
    end
end

function J = medianfilter(M, I)
    row_size = size(I, 1);
    col_size = size(I, 2);
    N = (sqrt(M) - 1)/2;
    J = zeros(row_size, col_size, 'uint8');
    
    paddedImg = zeros(row_size + 2*N, col_size + 2*N);
    paddedImg(N+1:N+row_size, N+1:N+col_size) = I;
    for n = 1:row_size
        for m = 1:col_size
            med = median(paddedImg(n:(n+N+N), m:(m+N+N)), 'all');
            J(n,m) = med;
        end
    end
end