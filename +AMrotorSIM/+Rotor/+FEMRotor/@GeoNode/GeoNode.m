classdef GeoNode < handle
% GeoNode Class of the geometric nodes which are used to build the
% discretisation
    properties
        name 
        x
        xi
        z 
    end
    
    methods
        function self = GeoNode(name, z, x, xi)
            self.name = name;
            self.z = z;
            self.x = x;
            self.xi = xi;
        end
    end
end
        