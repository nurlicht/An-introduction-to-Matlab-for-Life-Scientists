% 1. Showing a list and displaying the result (index of selected item)
menuTitle = 'Please select the Fluorescent Protein';
menuList = {'GFP (pdb ID: 1GFL)', 'RFP (pdb ID: 1GGX)'};
selectedIndex = menu(menuTitle, menuList);
selectedIndexText = num2str(selectedIndex);
disp(['The option #' selectedIndexText ' was selected.']);
