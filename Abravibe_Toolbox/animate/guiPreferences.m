function h0=guiComponents(aniFig,SETUP);

bcolor=[1 1 1]*0.8;
pos = [300 500];
POS = get(aniFig,'Position');
h0=figure('Color'           , bcolor, ...
   'MenuBar'                , 'none', ...
   'NumberTitle'            , 'off', ...
   'Name'                   , 'Preferences', ...
   'Position'               , [POS(1)+(POS(3)-pos(1))/2 POS(2)+(POS(4)-pos(2))/2+15 pos(1) pos(2)], ...
   'Resize'                 , 'off',...
   'Tag'                    , 'ANIMATE:PREFERENCES',...
   'WindowButtonUpFcn'      , 'command(''preferences'',''stack'');',...
   'CloseRequestFcn'        , ['command(''close'',''preferences'');']);

framePos    = [10 pos(2)-55 pos(1)-20 50];
h1=uicontrol('Parent',h0,...
   'Style'                  , 'Frame',...
   'Tag'                    , 'Frame:Controls',...
   'BackgroundColor'        , [1 1 1]*.8,...
   'Position'               , framePos);
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [30 framePos(2)+40 50 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Animation');

% Frames Text/Popup
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [20 framePos(2)+25 80 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Frames / cycle');
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Edit',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Value'                  , 1,...
   'Position'               , [20 framePos(2)+10 80 20],...
   'String'                 , num2str(SETUP.Animation.Frames),...
   'Callback'               , 'command(''preferences'',''animation'',''FPC'');',...
   'Tag'                    , 'Preferences:FPC');

% Amplitude Text/Popup
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [110 framePos(2)+25 70 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Amplitude');
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Edit',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Value'                  , 1,...
   'Position'               , [110 framePos(2)+10 80 20],...
   'String'                 , num2str(SETUP.Animation.Amplitude),...
   'Callback'               , 'command(''preferences'',''animation'',''Amp'');',...
   'Tag'                    , 'Preferences:Amp');

% Theta Text/Popup
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [200 framePos(2)+25 80 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Spin deg/cyc');
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Edit',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Value'                  , 1,...
   'Position'               , [200 framePos(2)+10 80 20],...
   'String'                 , num2str(SETUP.Animation.Theta),...
   'Callback'               , 'command(''preferences'',''animation'',''Deg'');',...
   'Tag'                    , 'Preferences:Deg');

% Display----
framePos    = [10 pos(2)-115 pos(1)-20 50];
h1=uicontrol('Parent',h0,...
   'Style'                  , 'Frame',...
   'Tag'                    , 'Frame:Controls',...
   'BackgroundColor'        , [1 1 1]*.8,...
   'Position'               , framePos);
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [30 framePos(2)+40 42 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Display');
% Annotate
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Checkbox',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'Position'               , [20 framePos(2)+25 80 20],...
   'Value'                  , SETUP.Display.Annotate,...
   'String'                 , 'Annotate',...
   'Callback'               , 'command(''preferences'',''display'',''Annotate'');',...
   'Tag'                    , 'Preferences:Annotate');
% Static
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Checkbox',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'Position'               , [120 framePos(2)+25 80 20],...
   'Value'                  , SETUP.Display.Static,...
   'String'                 , 'Static',...
   'Callback'               , 'command(''preferences'',''display'',''Static'');',...
   'Tag'                    , 'Preferences:Static');
% Markers
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Checkbox',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'Position'               , [220 framePos(2)+25 60 20],...
   'Value'                  , SETUP.Display.Markers,...
   'String'                 , 'Markers',...
   'Callback'               , 'command(''preferences'',''display'',''Markers'');',...
   'Tag'                    , 'Preferences:Markers');
% Labels
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Checkbox',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'Position'               , [20 framePos(2)+5 80 20],...
   'Value'                  , SETUP.Display.Labels,...
   'String'                 , 'Labels',...
   'Callback'               , 'command(''preferences'',''display'',''Labels'');',...
   'Tag'                    , 'Preferences:Labels');
% UCS
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Checkbox',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'Position'               , [120 framePos(2)+5 80 20],...
   'Value'                  , SETUP.Display.UCS,...
   'String'                 , 'UCS',...
   'Callback'               , 'command(''preferences'',''display'',''UCS'');',...
   'Tag'                    , 'Preferences:UCS');
% Spin
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Checkbox',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'Position'               , [220 framePos(2)+5 60 20],...
   'Value'                  , SETUP.Display.Spin,...
   'String'                 , 'Spin',...
   'Callback'               , 'command(''preferences'',''display'',''Spin'');',...
   'Tag'                    , 'Preferences:Spin');

% View----
framePos    = [10 pos(2)-205 pos(1)-20 80];
h1=uicontrol('Parent',h0,...
   'Style'                  , 'Frame',...
   'Tag'                    , 'Frame:Controls',...
   'BackgroundColor'        , [1 1 1]*.8,...
   'Position'               , framePos);
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [30 framePos(2)+framePos(4)-10 32 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'View');
% View Text/Popup
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [20 framePos(2)+60 100 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Axis');
str = {'X','Y','Z','Ortho'};
val = find(ismember(str,SETUP.View.Axis));
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Popup',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Value'                  , val,...
   'Position'               , [20 framePos(2)+45 110 20],...
   'String'                 , str,...
   'Callback'               , 'command(''preferences'',''view'',''Axis'');',...
   'Tag'                    , 'Preferences:Axis');
% Type Text/Popup
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [20 framePos(2)+25 100 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Type');
str = {'Single','Quad','Cross-eyed','Red/Blue Glasses'};
val = find(ismember(str,SETUP.View.Type));
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Popup',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Value'                  , val,...
   'Position'               , [20 framePos(2)+10 110 20],...
   'String'                 , str,...
   'Callback'               , 'command(''preferences'',''view'',''Type'');',...
   'Tag'                    , 'Preferences:Type');
% Up Vector Text/Popup
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [150 framePos(2)+60 100 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Up vector');
str = {'+X','+Y','+Z'};
val = find(ismember(str,SETUP.View.UpVector));
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Popup',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Value'                  , val,...
   'Position'               , [150 framePos(2)+45 110 20],...
   'String'                 , str,...
   'Callback'               , 'command(''preferences'',''view'',''UpVector'');',...
   'Tag'                    , 'Preferences:UpVector');
% Vector Type Text/Popup
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [150 framePos(2)+25 100 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Vector type');
str = {'Real','Imaginary','Complex'};
val = find(ismember(str,SETUP.View.VectorType));
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Popup',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Value'                  , val,...
   'Position'               , [150 framePos(2)+10 110 20],...
   'String'                 , str,...
   'Callback'               , 'command(''preferences'',''view'',''VectorType'');',...
   'Tag'                    , 'Preferences:VectorType');

% Colors----
framePos    = [10 pos(2)-280 pos(1)-20 65];
bcb         = SETUP.Colors.Background;
% Background
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , bcb,...
   'ForegroundColor'        , SETUP.Colors.Background,...
   'Position'               , framePos,...
   'Callback'               , 'command(''preferences'',''color'',''Background'');',...
   'Tag'                    , 'Preferences:BackgroundColor');
%Annotate
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , bcb,...
   'ForegroundColor'        , SETUP.Colors.Annotate,...
   'Position'               , [20 framePos(2)+35 60 20],...
   'String'                 , 'Annotate',...
   'Callback'               , 'command(''preferences'',''color'',''Annotate'');',...
   'Tag'                    , 'Preferences:AnnotateColor');
% Static
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , bcb,...
   'ForegroundColor'        , SETUP.Colors.Static,...
   'Position'               , [85 framePos(2)+35 60 20],...
   'String'                 , 'Static',...
   'Callback'               , 'command(''preferences'',''color'',''Static'');',...
   'Tag'                    , 'Preferences:StaticColor');
% Markers
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , bcb,...
   'ForegroundColor'        , SETUP.Colors.Markers,...
   'Position'               , [150 framePos(2)+35 60 20],...
   'String'                 , 'Markers',...
   'Callback'               , 'command(''preferences'',''color'',''Markers'');',...
   'Tag'                    , 'Preferences:MarkersColor');
% Labels
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , bcb,...
   'ForegroundColor'        , SETUP.Colors.Labels,...
   'Position'               , [215 framePos(2)+35 60 20],...
   'String'                 , 'Labels',...
   'Callback'               , 'command(''preferences'',''color'',''Labels'');',...
   'Tag'                    , 'Preferences:LabelsColor');

%Shape
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , bcb,...
   'ForegroundColor'        , SETUP.Colors.Shape,...
   'Position'               , [20 framePos(2)+10 60 20],...
   'String'                 , 'Shape',...
   'Callback'               , 'command(''preferences'',''color'',''Shape'');',...
   'Tag'                    , 'Preferences:ShapeColor');
% UCS
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , bcb,...
   'ForegroundColor'        , SETUP.Colors.UCS,...
   'Position'               , [85 framePos(2)+10 60 20],...
   'String'                 , 'UCS',...
   'Callback'               , 'command(''preferences'',''color'',''UCS'');',...
   'Tag'                    , 'Preferences:UCSColor');
% LeftEye
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , bcb,...
   'ForegroundColor'        , SETUP.Colors.LeftEye,...
   'Position'               , [150 framePos(2)+10 60 20],...
   'String'                 , 'Left Eye',...
   'Callback'               , 'command(''preferences'',''color'',''LeftEye'');',...
   'Tag'                    , 'Preferences:LeftEyeColor');
% RightEye
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , bcb,...
   'ForegroundColor'        , SETUP.Colors.RightEye,...
   'Position'               , [215 framePos(2)+10 60 20],...
   'String'                 , 'Right Eye',...
   'Callback'               , 'command(''preferences'',''color'',''RightEye'');',...
   'Tag'                    , 'Preferences:RightEyeColor');


% AVI / SNAPSHOT Option
framePos    = [10 pos(2)-440 pos(1)-20 150];
h1=uicontrol('Parent',h0,...
   'Style'                  , 'Frame',...
   'Tag'                    , 'Frame:Controls',...
   'BackgroundColor'        , [1 1 1]*.8,...
   'Position'               , framePos);
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [60 framePos(2)+framePos(4)-10 25 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'AVI');
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [190 framePos(2)+framePos(4)-10 55 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Snapshot');
% AVI Options
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [20 framePos(2)+130 100 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Format');
str = {'Indeo3';'Indeo5';'Cinepak';'None'};
val = find(ismember(str,SETUP.AVI.Format));
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Popup',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Value'                  , val,...
   'Position'               , [20 framePos(2)+115 110 20],...
   'String'                 , str,...
   'Callback'               , 'command(''preferences'',''avi'',''Format'');',...
   'Tag'                    , 'Preferences:AviFormat');

% AVI Quality
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [20 framePos(2)+90 60 17],...
   'HorizontalAlignment'    , 'left',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Quality %');
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Edit',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Position'               , [80 framePos(2)+90 50 20],...
   'String'                 , num2str(SETUP.AVI.Quality),...
   'Callback'               , 'command(''preferences'',''avi'',''Quality'');',...
   'Tag'                    , 'Preferences:AviQuality');
% AVI Length
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [20 framePos(2)+65 60 17],...
   'HorizontalAlignment'    , 'left',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'TooltipString'          , 'Movie length in seconds.',...
   'String'                 , 'Time sec.');
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Edit',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Position'               , [80 framePos(2)+65 50 20],...
   'String'                 , num2str(SETUP.AVI.TimeLength),...
   'Callback'               , 'command(''preferences'',''avi'',''TimeLength'');',...
   'TooltipString'          , 'Movie length in seconds.',...
   'Tag'                    , 'Preferences:AviTimeLength');
% AVI Do All Modes
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'checkbox',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'Position'               , [20 framePos(2)+45 110 20],...
   'String'                 , 'Do all modes',...
   'Value'                  , SETUP.AVI.DoAllModes,...
   'Callback'               , 'command(''preferences'',''avi'',''DoAllModes'');',...
   'TooltipString'          , 'Movie length in seconds.',...
   'Tag'                    , 'Preferences:AviDoAllModes');

% Snapshot Options
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [170 framePos(2)+130 100 17],...
   'HorizontalAlignment'    , 'center',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Format');
str = {'BMP monochrome';'BMP 24-bit';'EMF metafile';'EPS b&w';'EPS color';'EPS2 B&W';'EPS2 color';'JPEG 24-bit';'PCX 24-bit';'PDF color';'PNG 24-bit';'TIFF 24-bit'};
val = find(ismember(str,SETUP.Snapshot.Format));
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Popup',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Value'                  , val,...
   'Position'               , [170 framePos(2)+115 110 20],...
   'String'                 , str,...
   'Callback'               , 'command(''preferences'',''snapshot'',''Format'');',...
   'Tag'                    , 'Preferences:SSFormat');
% Snapshot Quality
%h1=uicontrol('Parent',h0,...
%   'Units'                  , 'pixels',...
%   'Style'                  , 'Text',...
%   'Position'               , [170 framePos(2)+90 60 17],...
%   'HorizontalAlignment'    , 'left',...
%   'Backgroundcolor'        , [1 1 1]*0.8,...
%   'String'                 , 'Quality %');
%h1=uicontrol('Parent',h0,...
%   'Units'                  , 'pixels',...
%   'Style'                  , 'Edit',...
%   'Backgroundcolor'        , [1 1 1]*1,...
%   'Position'               , [230 framePos(2)+90 50 20],...
%   'String'                 , num2str(SETUP.Snapshot.Quality),...
%   'Callback'               , 'command(''preferences'',''snapshot'',''Quality'');',...
%   'Tag'                    , 'Preferences:SSQuality');
str = {'Z-buffer';'Open GL';'Painters'};
val = find(ismember(str,SETUP.Snapshot.Renderer));
% Snapshot Renderer
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [170 framePos(2)+90 60 17],...
   'HorizontalAlignment'    , 'left',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Render');
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Popup',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Position'               , [210 framePos(2)+90 70 20],...
   'String'                 , str,...
   'Value'                  , val,...
   'Callback'               , 'command(''preferences'',''snapshot'',''Renderer'');',...
   'Tag'                    , 'Preferences:SSRender');
% Snapshot resolution
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [170 framePos(2)+65 60 17],...
   'HorizontalAlignment'    , 'Left',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'String'                 , 'Resolution');
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Edit',...
   'Backgroundcolor'        , [1 1 1]*1,...
   'Position'               , [230 framePos(2)+65 50 20],...
   'String'                 , num2str(SETUP.Snapshot.Resolution),...
   'Callback'               , 'command(''preferences'',''snapshot'',''Resolution'');',...
   'TooltipString'          , 'Movie length in seconds.',...
   'Tag'                    , 'Preferences:SSResolution');
% Snapshot Do All Modes
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'checkbox',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'Position'               , [170 framePos(2)+45 110 20],...
   'String'                 , 'Do all modes',...
   'Value'                  , SETUP.Snapshot.DoAllModes,...
   'Callback'               , 'command(''preferences'',''snapshot'',''DoAllModes'');',...
   'TooltipString'          , 'Movie length in seconds.',...
   'Tag'                    , 'Preferences:SSDoAllModes');

% Output path
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Text',...
   'Position'               , [20 framePos(2)+25 60 17],...
   'HorizontalAlignment'    , 'Left',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'TooltipString'          , 'Default path to save all modes for AVI and snapshots.',...
   'String'                 , 'Default path');
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'edit',...
   'Backgroundcolor'        , [1 1 1],...
   'Position'               , [20 framePos(2)+10 230 20],...
   'HorizontalAlignment'    , 'left',...
   'String'                 , SETUP.Path.Export,...
   'Callback'               , 'command(''preferences'',''exportPath'',''edit'');',...
   'TooltipString'          , 'Default path to save all modes for AVI and snapshots.',...
   'Tag'                    , 'Preferences:EditExportPath');
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , [1 1 1]*0.8,...
   'Position'               , [250 framePos(2)+10 30 20],...
   'String'                 , '...',...
   'Callback'               , 'command(''preferences'',''exportPath'',''push'');',...
   'TooltipString'          , 'Default path to save all modes for AVI and snapshots.',...
   'Tag'                    , 'Preferences:PushbuttonExportPath');

% AutoApply
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'checkbox',...
   'Backgroundcolor'        , [1 1 1]*.8,...
   'Position'               , [10 35 100 20],...
   'String'                 , 'Auto apply',...
   'Value'                  , SETUP.Animation.AutoApplyPrefs,...
   'Callback'               , 'command(''preferences'',''autoapply'');',...
   'Tooltipstring'          , 'Apply changes immediately',...
   'Tag'                    , 'Preferences:AutoApply');
% Apply
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , [1 1 1]*.8,...
   'Position'               , [10 5 65 25],...
   'String'                 , 'Apply',...
   'Callback'               , 'command(''preferences'',''apply'');',...
   'Tooltipstring'          , 'Apply pending changes',...
   'Tag'                    , 'Preferences:Apply');
% Cancel
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , [1 1 1]*.8,...
   'Position'               , [80 5 65 25],...
   'String'                 , 'Cancel',...
   'Callback'               , 'command(''close'',''preferences'');',...
   'Tooltipstring'          , 'Cancel changes not applied and close',...
   'Tag'                    , 'Preferences:Cancel');
% Save
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , [1 1 1]*.8,...
   'Position'               , [150 5 65 25],...
   'String'                 , 'Save',...
   'Callback'               , 'command(''preferences'',''save'');',...
   'Tooltipstring'          , 'Save preferences',...
   'Tag'                    , 'Preferences:Save');
% Reset
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , [1 1 1]*.8,...
   'Position'               , [220 30 65 25],...
   'String'                 , 'Reset',...
   'Callback'               , 'command(''preferences'',''reset'');',...
   'Tooltipstring'          , 'Restore software defaults',...
   'Tag'                    , 'Preferences:Reset');
% Defaults
h1=uicontrol('Parent',h0,...
   'Units'                  , 'pixels',...
   'Style'                  , 'Pushbutton',...
   'Backgroundcolor'        , [1 1 1]*.8,...
   'Position'               , [220 5 65 25],...
   'String'                 , 'Defaults',...
   'Callback'               , 'command(''preferences'',''defaults'');',...
   'Tooltipstring'          , 'Reload saved parameters',...
   'Tag'                    , 'Preferences:Defaults');
