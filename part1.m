clc; clear all; close all;

% Get the image file
id = 21602416;
rem = mod(id, 4);
fname = ['image',num2str(rem),'.jpg'];
A = imread(fname);

% Part 1.a
n = size(A, 1);
m = size(A, 2);
Y = zeros(n, m, 'logical');

for row = 1:n
   for col = 1:m
       if A(row, col, 1) > 140
           Y(row, col) = 1;
       end
   end
end
  
figure;
imshow(Y);
title('Part 1.a');
drawnow;

% Part 1.b
n = size(A, 1);
m = size(A, 2);
Y = zeros(n, m, 'logical');

for row = 1:n
   for col = 1:m
       if A(row, col, 2) > 140
           Y(row, col) = 1;
       end
   end
end

figure;
imshow(Y);
title('Part 1.b');
drawnow;

% Part 1.c
n = size(A, 1);
m = size(A, 2);
Y = zeros(n, m, 'logical');

for row = 1:n
   for col = 1:m
       if A(row, col, 3) > 140
           Y(row, col) = 1;
       end
   end
end
  
figure;
imshow(Y);
title('Part 1.c');
drawnow;

% Part 1.d
n = size(A, 1);
m = size(A, 2);
Y = zeros(n, m, 'logical');

for row = 1:n
   for col = 1:m
       if A(row, col, 1) > 140 && A(row, col, 2) > 140 && A(row, col, 3) < 30
           Y(row, col) = 1;
       end
   end
end
  
figure;
imshow(Y);
title('Part 1.d');
drawnow;

%Part 1.e
n = size(A, 1);
m = size(A, 2);
Y = zeros(n, m, 'uint8');

for row = 1:n
   for col = 1:m
       Y(row, col) = (A(row, col, 1) + A(row, col, 2) + A(row, col, 3))/3;
   end
end
  
figure;
imshow(Y, [0 255]);
title('Part 1.e');
drawnow;
imwrite(Y, 'gray.jpg');
