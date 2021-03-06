function h = get_loc_load_vec(obj,varargin)

%Constant fix force 
    obj.h = sparse(6,1);

    % dof-order: ux,uy,uz,psix,psiy,psiz

    %%
    Fx = obj.cnfg.betrag_x;
    Fy = obj.cnfg.betrag_y;

    obj.h(1) =  Fx;
    obj.h(2) =  Fy;
    
    h = obj.h;
end