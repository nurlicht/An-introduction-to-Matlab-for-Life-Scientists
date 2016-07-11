% 1. Calculating and displaying the sum
% 2. Separating "data" from the "code"
% 3. A) Avoiding automatic display, and B) Nice display of output
% 4. Customizing the displayed output
% 5. Clearing the screen (before writing to it)
% 6. Including more information (inputs) in the displayed message
% 7. Displaying the message in the form of a message box (GUI)
% 8. Getting the two input numbers interactively using GUI

%New part (8)
dlgTitle = 'Input numbers';
prompt = {'First number:','Second number:'};
numbersText = inputdlg(prompt,dlgTitle);
a = str2num(numbersText{1});
b = str2num(numbersText{2});
%

c = a + b;

aText = num2str(a);
bText = num2str(b);
cText = num2str(c);

customizedText = ['The sum of ' aText ' and ' bText ' is ' cText];

clc;

msgbox(customizedText);
