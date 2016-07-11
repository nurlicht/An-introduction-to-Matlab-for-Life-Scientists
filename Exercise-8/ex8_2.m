% 1. Calculating the corners of an icosahedron
% 2. Plotting the icosahedron
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

% New part (2)
H = figure;
set(H,'color','w');

subplot(2, 2, 1);
scatter3(V(:,1), V(:,2), V(:,3));
axis equal;
axis tight;
axis off;
%
