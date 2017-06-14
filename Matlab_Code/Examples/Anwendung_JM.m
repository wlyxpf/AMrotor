%% Tutorialanwendung
% Zur Demonstration der AMrotorSIM-Toolbox

%% Header

% Johannes Maierhofer
% 28.03.2017,29.03.2017,30.03.2017,31.03.2017,03.04.2017,04.04.2017,05.04.2017,06.04.2017,12.04.2017
% 24.05.2017,26.05.2017,29.05.2017
%
%         .o.       ooo        ooooo                        .                      
%        .888.      `88.       .888'                      .o8                      
%       .8"888.      888b     d'888  oooo d8b  .ooooo.  .o888oo  .ooooo.  oooo d8b 
%      .8' `888.     8 Y88. .P  888  `888""8P d88' `88b   888   d88' `88b `888""8P 
%     .88ooo8888.    8  `888'   888   888     888   888   888   888   888  888     
%    .8'     `888.   8    Y     888   888     888   888   888 . 888   888  888     
%   o88o     o8888o o8o        o888o d888b    `Y8bod8P'   "888" `Y8bod8P' d888b    

%% Import

import AMrotorSIM.*

%% Clean up
close all
clear all
clc

%% Compute Rotor

Config_Sim

r=Rotorsystem(cnfg,'System');
%r.show;

r.rotor.mesh();

g=Graphs.Visu_Rotorsystem(r);
g.show();

r.compute_matrices();
r.compute_loads();

r.transform_StateSpace();


%r.reduce_modal(10);

%% Running system analyses

% m=Experiments.Modalanalyse(r);
% 
% m.calculate_rotor_only(4,0:100:1000);
% esf = Graphs.Eigenschwingformen(m);
% esf.plot();
% 

% 
% m.calculate_rotorsystem(5,0:100:200);
% esf2= Graphs.Eigenschwingformen(m);
% esf2.plot();

%
% m.calculate_rotorsystem_ss(10,0:100:200);
% esf2= Graphs.Eigenschwingformen(m);
% esf2.plot_displacements();

% m.calculate_rotorsystem(3,0:100:3000);
% cmp = Graphs.Campbell(m);
% cmp.plot();

%% Running Time Simulation

St_Lsg = Experiments.Stationaere_Lsg(r,1000,[0:0.01:10]);
St_Lsg.show()
% St_Lsg.compute()
% St_Lsg.compute_newmark()
St_Lsg.compute_ode15s_ss()

<<<<<<< HEAD:Matlab_Code/Examples/Anwendung.m
 w = Graphs.Wegorbit(r);
 k = Graphs.Lagerkraefte(r);
 v = Graphs.Velocity(r);
 for sensor = r.sensors
    switch sensor.type 
        case  1
            w.plot(sensor);
        case 2
            k.plot(sensor);
        case 3
            v.plot(sensor);
    end
 end   
=======
z= Graphs.TimeSignal(r);
z.plot(r.sensors);

w = Graphs.Wegorbit(r);
w.plot(r.sensors);
>>>>>>> developer:Matlab_Code/Examples/Anwendung_JM.m
