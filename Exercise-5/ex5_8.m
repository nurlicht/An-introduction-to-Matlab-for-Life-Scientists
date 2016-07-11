% Calculating the number PI using this formula
% https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80

N = 100000;

tic;
Sum = 0;
for n = 0:N
    Sum = Sum + 4 * (-1) ^ n / (2 * n + 1);
end
t = toc;
disp(['Pi = ' num2str(Sum) ' (t = ' num2str(t) ' seconds)']);
disp(' ');

tic;
n = 0:N;
Sum = sum(4 * (-1) .^ n ./ (2 * n + 1));
t = toc;
disp(['Pi = ' num2str(Sum) ' (t = ' num2str(t) ' seconds)']);
disp(' ');

