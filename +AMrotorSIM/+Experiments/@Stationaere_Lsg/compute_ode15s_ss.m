% Licensed under GPL-3.0-or-later, check attached LICENSE file

function compute_ode15s_ss(obj)
        
        Timer = AMrotorTools.Timer();
         
        disp('Compute.... ode15s State Space ....')
        obj.rotorsystem.check_for_non_integrable_components;
        obj.clear_time_result()
        
        obj.result = containers.Map('KeyType','double','ValueType','any');

        
       for rpm = obj.drehzahlen 
        disp(['... rotational speed: ',num2str(rpm),' U/min'])
        
        n_nodes = length(obj.rotorsystem.rotor.mesh.nodes);
        
        Omega = rpm*pi/30;           
        
        [mat.A,mat.B] = obj.get_state_space_matrices(Omega);        
        
        %%init Vector
        ndof = length(mat.A)/2;
        Z0 = zeros(2*ndof,1);     % Mit null belegen:
        Z0(1*ndof+6:6:2*ndof)=Omega;        % Drehzahl fuer psi_z
        
        
        % solver parameters
        options = odeset('AbsTol', 1e-5, 'RelTol', 1e-5,'OutputFcn',@odeOutputFcnController,'MaxStep',obj.time(2)-obj.time(1));

        Timer.restart();
        disp('... integration started...')
        
        sol = ode15s(@integrate_function,obj.time,Z0, options, Omega, obj.rotorsystem, mat);
        [Z,Zp] = deval(sol,obj.time);
        
        
        disp(['... spent time for integration: ',num2str(Timer.getWallTime()),' s'])

        
        res.X = Z(1:6*n_nodes,:);
        res.X_d = Z(6*n_nodes+1:2*6*n_nodes,:);
        res.X_dd= Zp(6*n_nodes+1:2*6*n_nodes,:);
        res.F = obj.rotorsystem.calculate_force_load_post_sensor(obj.time,res.X,res.X_d);
        res.FBearing = obj.rotorsystem.calculate_bearing_force(obj.time,res.X,res.X_d);
        res.Fcontroller = obj.rotorsystem.calculate_controller_force(obj.time,res.X,res.X_d);
        
        obj.result(rpm)=res;
        
       end

     end