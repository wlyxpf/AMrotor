function [ output ] = LookUpTable( self, rpmTable, inputCell, rpmCurrent )     
% structure of inputs and outputs
%
% displacement = 1 x Ndisplacment array
% current = 1 x Ncurrent array
% force = Ndisplacemet x Ncurrent
%
% outputMatrix = 6 x 6 matrix for rpmCurrent

output = zeros(6,6);
for i = 1:6
    for j = 1:6
        if isempty(inputCell{i,j}) %allows slim tables, only interesting coefficiens are stored
            output(i,j)=0;
        else
            output(i,j) = interp1(rpmTable, inputCell{i,j}, rpmCurrent, 'linear');
        end
    end
end
output = sparse(output);
% dof-order: ux,uy,uz,psix,psiy,psiz



if rpmCurrent > max(rpmTable)
    warning(['Extrapolation of Component-Coefficients from Look-Up-Table ',... 
            'at rotational speed of more than max(Table.rpm)=',...
            num2str(max(rpmTable)),'. ',...
            'Results may be inaccurate!']);
end
end

