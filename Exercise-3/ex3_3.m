% 1. Showing a list and displaying the result (index of selected item)
% 2. Also displaying the selected item (fluorescent protein)
% 3. Loading and 3D visualizing the selected fluorescent protein
menuTitle = 'Please select the Fluorescent Protein';
menuList = {'GFP (pdb ID: 1GFL)', 'RFP (pdb ID: 1GGX)'};
selectedIndex = menu(menuTitle, menuList);
selectedIndexText = num2str(selectedIndex);
disp(['The option #' selectedIndexText ' was selected.']);

selectedOption = menuList{selectedIndex};
disp(['The selected fluorescent protein is ' selectedOption]);

% New part (3)
pdbList = {'1GFL', '1GGX'};
selectedPDB = pdbList{selectedIndex};
molviewer(selectedPDB);
%
