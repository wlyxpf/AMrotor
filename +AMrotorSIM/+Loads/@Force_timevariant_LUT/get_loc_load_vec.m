function h = get_loc_load_vec(obj,time,varargin)

obj.h = sparse(6,1);

% dof-order: ux,uy,uz,psix,psiy,psiz

LUT = obj.cnfg.LUT;

h(1,:) = interp1(LUT.time, LUT.Fx, time, 'linear');
h(2,:) = interp1(LUT.time, LUT.Fy, time, 'linear');
h(3,:) = interp1(LUT.time, LUT.Fz, time, 'linear');
h(4,:) = interp1(LUT.time, LUT.Mx, time, 'linear');
h(5,:) = interp1(LUT.time, LUT.My, time, 'linear');
h(6,:) = interp1(LUT.time, LUT.Mz, time, 'linear');

obj.h = h;

if time > max(LUT.time)
    warning(['Extrapolation of force from Look-Up-Table ',...
        'at time greater than max(LUT.time)=',...
        num2str(max(LUT.time)),'. ',...
        'Force may be unexpected!']);
end
end