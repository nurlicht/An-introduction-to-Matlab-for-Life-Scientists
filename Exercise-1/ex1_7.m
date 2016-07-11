% 1. Calculating and displaying the sum
% 2. Separating "data" from the "code"
% 3. A) Avoiding automatic display, and B) Nice display of output
% 4. Customizing the displayed output
% 5. Clearing the screen (before writing to it)
% 6. Including more information (inputs) in the displayed message
% 7. Displaying the message in the form of a message box (GUI)
a = 4;
b = 7;

c = a + b;

aText = num2str(a);
bText = num2str(b);
cText = num2str(c);

customizedText = ['The sum of ' aText ' and ' bText ' is ' cText];

clc;

%New part (7)
msgbox(customizedText);
%
