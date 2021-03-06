function plot_sensors(ax,sensors)

for sensor=sensors
    %if isa(sensor,'AMrotorSIM.Sensors.Displacementsensor')
    zp=sensor.cnfg.position;
    
    % Visualization parameters setting -----------------------------
    color = AMrotorTools.TUMColors.TUMGreen;
    
    if ~isfield(sensor.cnfg,'color')
    elseif isempty(sensor.cnfg.color)
    else
        color = sensor.cnfg.color;
    end
    
    width = 1;
    if ~isfield(sensor.cnfg,'width')
    elseif isempty(sensor.cnfg.width)
    else
        width=sensor.cnfg.width;
    end
    
    length= 0.1;
    if ~isfield(sensor.cnfg,'length')
    elseif isempty(sensor.cnfg.length)
    else
        width=sensor.cnfg.length;
    end
    
    % Plot -------------------
    h=quiver3(ax,[zp,zp],[0,0],[0,0],[0,0],[0,length],[length,0]);
    h.Color=color;
    h.LineWidth = width;
    %end
end