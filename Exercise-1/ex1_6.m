% 1. Calculating and displaying the sum
% 2. Separating "data" from the "code"
% 3. A) Avoiding automatic display, and B) Nice display of output
% 4. Customizing the displayed output
% 5. Clearing the screen (before writing to it)
% 6. Including more information (inputs) in the displayed message
a = 4;
b = 7;

c = a + b;

%New part (6)
aText = num2str(a);
bText = num2str(b);
%

cText = num2str(c);

%New part (6)
customizedText = ['The sum of ' aText ' and ' bText ' is ' cText];
%

clc;

disp(customizedText);
