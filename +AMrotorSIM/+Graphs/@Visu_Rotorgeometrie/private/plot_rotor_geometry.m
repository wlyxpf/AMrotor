function [n] = plot_rotor_geometry(rotor)

nodes = rotor.nodes;
rotorpar = rotor.cnfg;
% das ist eine Funktion die zu jedem Element des Rot0rs einen zylinder
% erzeugt 


a=1;
n=1;
dimR=size(rotorpar.rotor_dimensions);
n_nodes=length(nodes);

r=zeros(n_nodes,1);
% erzeuge Vektor r mit Radien der Abschnitte
%==========================================================================
for k=1:n_nodes

while nodes(n) <= rotorpar.rotor_dimensions(a,1) && n <n_nodes
    
    r(n,1)=rotorpar.rotor_dimensions(a,2);
    
    n=n+1;
    
end

if a < dimR(1)
a=a+1;
end

end

 r(end)=rotorpar.rotor_dimensions(end,2);
%==========================================================================








myaxes = axes('xlim', [-10 10], 'ylim', [-10 10], 'zlim',[-10 10]);

view(3);
grid on;
axis equal;
hold on
xlabel('x')
ylabel('y')
zlabel('z')

dim_r=size(r);


theta = linspace(0,2*pi,20);

k=1;

%%%%%%%%%%%%%%%%%%%%%%%
%erstes el
rs = linspace(0,r(1),2);
% 
 [TH,R] = meshgrid(theta,rs);
% 
 Z=((R.*cos(TH)).^2)-((R.*sin(TH)).^2); % z=(x^2)-(y^2)
% 
 [x,y,z] = pol2cart(TH,R,Z);
 
 z=z*0;

%hs(1)=surf(z+nodes(1),y,x);
hs(1)=surf(x,y,z+nodes(1));
set(hs(1), 'edgecolor','none')
set(hs(1), 'facecolor','b')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for n=2:dim_r(1)

 %Berechnen der Zylinderelemente   
[xzyl, yzyl, zzyl] = cylinder([r(n) r(n)]);

[xZ1, yz1, zZ1] = cylinder([r(n) r(n)]);


zzyl(1,:)=nodes(n-1);

zzyl(2,:)=nodes(n);




%% berechenen der Scheiben bzw Zyl. Deckel :-))


% 
rs = linspace(0,r(n),2);
% 
 [TH,R] = meshgrid(theta,rs);
% 
 Z=((R.*cos(TH)).^2)-((R.*sin(TH)).^2); % z=(x^2)-(y^2)
% 
 [x,y,z] = pol2cart(TH,R,Z);
 
 z=z*0;


%plote Zylinder
%hz(n) = surf(zzyl,yzyl, xzyl);
hz(n) = surf(xzyl,yzyl, zzyl);
set(hz(n), 'edgecolor','none')
set(hz(n), 'facecolor','b')
%Plote Deckel
%hs(n)=surf(z+nodes(n),y,x);
hs(n)=surf(x,y,z+nodes(n));
set(hs(n), 'facecolor','b')

if r(n) > r(n-1) 

set(hs(n), 'edgecolor','none') %sichtbare deckel ohne edges

end



if r(n) < r(n-1)

    set(hs(n-1), 'edgecolor','none')   %sichtbare deckel ohne edges
    
end




k=k+2;




end

set(hs(n), 'edgecolor','none')
set(hs(n), 'facecolor','b')


zz=1:50;

% %Scheiben;
% if disc ==1
% 
% [xZ1, yZ1, zZ1] = cylinder([rz1+5*zz rz1+5*zz zz]);
% 
% zZ1(1,:)=z1;
% 
% yZ1(2,:)=yZ1(2,:);
% 
% yZ1(1,:)=yZ1(1,:);
% 
% hz1 = surf(zZ1, yZ1, xZ1);
% end


end





