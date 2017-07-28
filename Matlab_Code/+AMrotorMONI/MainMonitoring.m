%% Tutorialanwendung
% Zur Demonstration der AMrotorSIM-Toolbox

%% Header

% Robert H�fer, Johannes Maierhofer
% 28.07.2017

%% Import
import AMrotorMONI.*

%% Clean up
close all
clear all
clc

%% Datenvorbereitung
[dataset, datasetNeu]=Datenaufbereitung;

%% Lagerkrafmessung
% Parameter

cnfg.Lagerabstand = 0.59;               %Abstand zwischen den beiden Auflagern in Meter
cnfg.Eigenfrequenz = 63.5*2*pi;         %Eigenfrequenz des Rotors in rad/sec.

% Instanzieren eines Objekts
KraftMonitor = BearingForceApproach('KraftMonitor');
KraftMonitor.cnfg=cnfg;

% Aufruf Berechnungsfunktionen
KraftMonitor.initialize(dataset);
KraftMonitor.revise(dataset);
KraftMonitor.show;

%% Positionsmessung
% Parameter
cnfg.ModaleMasse1EO = 5.817;
cnfg.MasseRotorGesamt = 11.123;
cnfg.zPosUnwucht = 0.095;
cnfg.zPosSensor = 0.3050;
ESF1_path = ['.\+AMrotorMONI\RotorConfiguration\','ESF1','.mat'];
load(ESF1_path);
ESF1.uESF1=uESF1;
ESF1.zESF1=zESF1;

% Ende Parameter, �bergabe Parameter an Klasse
PosiMonitor = RotorDeflectionApproach('PositionsMonitor');
PosiMonitor.cnfg = cnfg;
PosiMonitor.ESF1 = ESF1;

% Aufruf Berechnungsfunktionen
PosiMonitor.initialize(dataset);
PosiMonitor.revise(dataset);
PosiMonitor.show;


%% Kombination Lagerkraft und Positionsmessung
% Implementierung der Klasse

KombiMonitor = CombinedForceDeflectionApproach('KombiniertesMonitoring');

% Parameter


%% Aufruf Berechungsfunktionen
%KombiMonitor.initialize;
%KombiMonitor.revise;
KombiMonitor.show;