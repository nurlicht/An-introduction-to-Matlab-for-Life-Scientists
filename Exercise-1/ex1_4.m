% 1. Calculating and displaying the sum
% 2. Separating "data" from the "code"
% 3. A) Avoiding automatic display, and B) Nice display of output
% 4. Customizing the displayed output 
a = 4;
b = 7;

c = a + b;

cText = num2str(c);

%New part (4)
customizedText = ['The sum is ' cText];
%

disp(customizedText);
