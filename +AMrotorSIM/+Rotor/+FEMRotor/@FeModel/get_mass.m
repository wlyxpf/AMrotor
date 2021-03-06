function [m, J]=get_mass(self)

u=zeros(6*length(self.mesh.nodes),1);

for node = self.mesh.nodes
  u(self.get_gdof('u_x',node.name))=1;
%  u(self.get_gdof('u_y',node.name))=1;
%  u(self.get_gdof('u_z',node.name))=1;
end

m=u'*self.matrices.M*u;

u=zeros(6*length(self.mesh.nodes),1);

for node = self.mesh.nodes
  u(self.get_gdof('psi_z',node.name))=1;
end

J=u'*self.matrices.M*u;

end