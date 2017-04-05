classdef Unbalance_static < AMrotorSIM.Loads.Load
   properties

   end
   methods
       %Konstruktor
        function obj=Unbalance_static(variable) 
           obj = obj@AMrotorSIM.Loads.Load(variable); 
        end 
       
        function compute_load(obj)
            % Positionen in Gesamtvektor
            
            unwucht = obj.cnfg.betrag;
            phase = obj.cnfg.winkellage;
            
            obj.h.h_ZPcos(1) =  unwucht*cos(phase);
            obj.h.h_ZPcos(3) =  unwucht*sin(phase);
            obj.h.h_ZPsin(1) =  - unwucht*sin(phase);
            obj.h.h_ZPsin(3) =  unwucht*cos(phase);

            obj.h.h_DBcos(1) =  unwucht*sin(phase);
            obj.h.h_DBcos(3) = - unwucht*cos(phase);
            obj.h.h_DBsin(1) =  unwucht*cos(phase);
            obj.h.h_DBsin(3) =  unwucht*sin(phase); 
        end
        
   end
end