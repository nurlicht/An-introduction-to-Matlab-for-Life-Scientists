% 1. Calculating and displaying the sum
% 2. Separating "data" from the "code"
% 3. A) Avoiding automatic display, and B) Nice display of output
% 4. Customizing the displayed output
% 5. Clearing the screen (before writing to it)
a = 4;
b = 7;

c = a + b;

cText = num2str(c);

customizedText = ['The sum is ' cText];

%New part (5)
clc;
%

disp(customizedText);
