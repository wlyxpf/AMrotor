function [ss_h]= compute_system_load_variant(self,t, Z)

h_loads = self.assemble_system_loads(t,Z);

%% Put together
h = h_loads;

ss_h=[zeros(length(h),1);h];
         
end