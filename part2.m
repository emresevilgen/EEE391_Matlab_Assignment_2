clc; clear all; close all;

% Get the image file
imgray = imread('gray.jpg');
n = size(imgray, 1);
m = size(imgray, 2);

% Part 2.b
gaussnoise = 8*randn(n, m);
imgaussnoise = uint8(double(imgray) + gaussnoise);
figure;
imshow(imgaussnoise, [0 255]);
title('Corrupted image at Part 2.b');
drawnow;

% Part 2.c
Ms = [9 25 121];
displayForMs(Ms, imgaussnoise, '2.c');

% Part 2.d
gaussnoise = 32*randn(n, m);
imgaussnoise = uint8(double(imgray) + gaussnoise);
figure;
imshow(imgaussnoise, [0 255]);
title('Corrupted image at Part 2.d');
drawnow;

Ms = [9 25 121];
displayForMs(Ms, imgaussnoise, '2.d');

% Part 2.e
imsaltnoise = imgray;
noisypixels = rand( size(imgray,1), size(imgray,2) );
imsaltnoise(noisypixels <= (1 / 16)) = 255;
imsaltnoise(noisypixels >= (15 / 16)) = 0;
figure;
imshow(imsaltnoise, [0 255]);
title('Salt and pepper type noise at Part 2.e');
drawnow;

% Part 2.f
Ms = [9 25 121];
displayForMs(Ms, imsaltnoise, '2.f');


function displayForMs(Ms, image, part)
    for i = 1: size(Ms, 2)
        J = meanfilter(Ms(1, i), image);
        figure;
        imshow(J, [0 255]);
        tit_str = ['M = ', num2str(Ms(1, i)), ' at Part ', part];
        title(tit_str);
        drawnow;
    end
end

% Part 2.a
function J = meanfilter(M, I)
    row_size = size(I, 1);
    col_size = size(I, 2);
    N = (sqrt(M) - 1)/2;
    J = zeros(row_size, col_size, 'uint8');
    for n = 1:row_size
        for m = 1:col_size
            sum = 0;
            for i = n-N:n+N
                if i >= 1 && i <= row_size
                    for j = m-N:m+N
                        if j >= 1 && j <= col_size
                            sum = sum + uint32(I(i, j));
                        end
                    end
                end
            end
            J(n,m) = sum/M;
        end
    end
end