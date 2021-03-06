function x0 = get_zero_crossing(self,x,y)
%GET_ZERO_CROSSING get the smallest zero crossing of x,y
% finds all zero crossings, but only returns the smallest value
% 
% Predominantly used for the damping ration over rpm to detremine the zero
% crossing of the damping to find the stability limit of the system
% 
% x0 = get_zero_crossing(self,x,y)

x0=[];
i=find(diff(sign(y))<0); % Uebergang von positiv zu negativen Werten

for k=1:length(i)
    itmp=i(k);
    x0tmp = interp1(y(itmp:itmp+1),x(itmp:itmp+1),0);
    x0(end+1)=x0tmp;
end

% nur den kleinsten Wert behalten
x0=min(x0);

if isempty(x0)
    x0=NaN;
end
end

