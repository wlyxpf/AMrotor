classdef Orbitdarstellung < handle
% Orbitdarstellung Class for visualisation of the orbit as result of the
% time integration
   properties
    unit
    rotorsystem
    name=' ---  Orbitdarstellung  --- '
    % See also AMrotorSIM.Experiments.Stationaere_Lsg AMrotorSIM.Experiments.Hochlaufanalyse
    experiment
    % See also AMrotorTools.PlotColors
    ColorHandler
   end
  methods
  function self=Orbitdarstellung(a, experiment) 
      self.rotorsystem = a;
      self.experiment = experiment;
      self.ColorHandler = AMrotorTools.PlotColors();
      self.ColorHandler.set_up(length(experiment.drehzahlen));
  end
      
   end
      
end