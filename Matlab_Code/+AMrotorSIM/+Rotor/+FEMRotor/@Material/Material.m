classdef Material < handle
    
    properties
        
        name
        e_module
        density
        poisson
        shear_factor
        
    end
    
    methods
        function self = Material(cnfg)
            if nargin==0
                self.name = 'No Material configuration';
            else
                self.name = cnfg.name;
                self.e_module = cnfg.e_module;
                self.density = cnfg.density;
                self.poisson = cnfg.poisson;
                self.shear_factor = cnfg.shear_factor;
            end
        end   
    end
end