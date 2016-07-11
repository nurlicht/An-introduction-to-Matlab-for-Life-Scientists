% 4. Loading two biomolecules (1IRK) and (3LCK)
% 5. Visualizaing the two biomolecules
% 6. Sequence alignment of the biomolecules
url1 = 'http://www.rcsb.org/pdb/explore.do?structureId=1IRK';
url2 = 'http://www.rcsb.org/pdb/explore.do?structureId=3LCK';
url3 = 'http://www.mathworks.com/help/bioinfo/examples/calling-bioperl-functions-from-matlab.html#zmw57dd0e14505';
disp([ ...
    'Accessing PDB entries ' ...
    '<a href="' url1 '" target="_blanl">1</a>' ...
    ' and ' ...
    '<a href="' url2 '" target="_blanl">2</a>' ...
    ' (' ...
    '<a href="' url3 '" target="_blanl">a Matlab demo</a>' ...
    ')'
    ]);

irkStruct = pdbread('pdb1irk.ent');
lckStruct = pdbread('pdb3lck.ent');
disp('Loading biomolecules completed.');

molviewer(irkStruct);
molviewer(lckStruct);

% New part (6)
[Score, Alignment] = swalign(irkStruct, lckStruct, 'showscore', true);
showalignment(Alignment);
%
