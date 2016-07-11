% 1. Calculating the corners of an icosahedron
% 2. Plotting the icosahedron
% 3. Calculating the surface of an apple
% 4. Plotting the apple.
% 5. Showing the flyer for Mathematikon Opening 
close all force;
clear;
clc;

%Icosahedron
url = 'https://en.wikipedia.org/wiki/Capsid';
disp(['An ' ...
    '<a href="' url '" target="_blank">icosahedron</a>' ...
    ' has 12 corners, 20 faces, and 30 edges.' ...
    ]); 
nVertex = 12;
thetaC = atan(2);
Omega = 2 * pi / 5;
nVertexHalf = nVertex / 2;
V = zeros(nVertex, 3);
V(1,:) = [0 0 1];
for cntr = 2:nVertexHalf
    r = 1;
    theta = thetaC;
    phi = (cntr - 2) * Omega;
    x = r * sin(theta) * cos(phi);
    y = r * sin(theta) * sin(phi);
    z = r * cos(theta);
    V(cntr, :) = [x, y, z];

    r = 1;
    theta = pi - thetaC;
    phi = (cntr + 0.5) * Omega;
    x = r * sin(theta) * cos(phi);
    y = r * sin(theta) * sin(phi);
    z = r * cos(theta);
    V(cntr + 5, :) = [x, y, z];
end
V(nVertex,:) = [0 0 -1];

H = figure;
set(H,'color','w');

subplot(2, 2, 1);
scatter3(V(:,1), V(:,2), V(:,3));
axis equal;
axis tight;
axis off;


%Apple
n1D = 80;
rMax = 1;
array1D = linspace(-rMax, rMax, n1D);
[x,y] = meshgrid(array1D);

disp('The upper and lower halves of an apple are radially-symmetric');
r = sqrt(x.* x + y .* y);
z1 = 2 * sqrt(r .* (1 - r));
z2 = - 2 * sqrt(r.^0.35 .* (1 - r));
nanIndex = (r > 1);
z1(nanIndex) = 0;
z2(nanIndex) = 0;

subplot(2, 2, 3);
mesh(x, y, z1);
hold on
mesh(x, y, z2);
axis equal;
axis tight;
axis off;

% New part (5)
subplot(1, 2, 2);
url = 'http://www.zmbh.uni-heidelberg.de/Central_Services/Imaging_Facility/Matlab/Mathematikon.png';
flyerImage = imread(url);
imagesc(flyerImage);
axis equal;
axis tight;
axis off;
%
