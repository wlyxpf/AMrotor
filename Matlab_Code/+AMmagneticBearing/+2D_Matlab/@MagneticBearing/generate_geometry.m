function generate_geometry( self, cnfg_geometry )
%GENERATE_GEOMETRY Summary of this function goes here
%   Detailed explanation goes here

for i = 1:length(cnfg_geometry.rect)
    gm(:,i)=cnfg_geometry.rect(i).geo';
    ns{i}=cnfg_geometry.rect(i).name;
end
for j = 1:length(cnfg_geometry.circ)
    gm(:,j+i)=cnfg_geometry.circ(j).geo';
    ns{j+i}=cnfg_geometry.circ(j).name;
end

 ns=char(ns(:))';

[dl,bt]=decsg(gm,cnfg_geometry.sf,ns);                    % Erzeugen der Geometrie 

edges.delete=[8,176,93,22,114,117,178,100,180,94,125,166,89,168,18,104,170,130,98,172,103,122,174,163, ...
              144,111,126,127,9,149,10,150,90,14,128,135,160,15,129,151,97,19,24,95,96,106,20,25,91,132,112,154,155,101,156,145,138,136,102,161,157,107,121,13,21,162,137,120,26,12,92,146,119,11,118,113,105,16,133,17];

[dl,bt]=csgdel(dl,bt, edges.delete);    % Loesche alle Kanten aus dem Array "KantenDel"

% Rotation und Kopieren der Pole und Spulen
alpha=90;
rotMat=[cosd(-alpha) -sind(-alpha);sind(-alpha) cosd(-alpha)];  % Drehmatrix


pg = geometryFromEdges(self.model,dl);           % Erzeugen der Geometrie

end

