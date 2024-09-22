function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 12-Mar-2021 12:53:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath('nnet')

F = str2num(get(handles.edit1,'String'));
H = str2num(get(handles.edit2,'String'));
Input = [F H];
[num txt raw] = xlsread('Data.xlsx',1);

Ind = [];
for i = 1 : size(num,1)
      if isequal(num(i,1:2),[F H])
          Ind = i;
          break;
      end
end

if ~isempty(Ind )
load(['PA_netbfg.mat'])
PA_bfg= abs(sim(net,Input'));
set(handles.edit6,'String',num2str(PA_bfg))

load(['PA_netscg.mat'])
PA_scg= abs(sim(net,Input'));
set(handles.edit7,'String',num2str(PA_scg))

load(['PA_netrp.mat'])
PA_rp= abs(sim(net,Input'));
set(handles.edit8,'String',num2str(PA_rp))

Er = [abs(num(Ind,3)-PA_bfg) abs(num(Ind,3)-PA_scg) abs(num(Ind,3)-PA_rp)];
figure,
hold on
grid on
bar(1,Er(1),0.5,'r')
bar(2,Er(2),0.5,'g')
bar(3,Er(3),0.5,'b')
set(gca,'XtickLabel',{ ' ' 'ANN-BFG' ' ' 'ANN-SCG' ' ' 'ANN-RP'})
set(gca,'fontweight','bold')
ylabel('Error')
title('Peak Acceleration')


figure,
plot([num(Ind,3) PA_bfg PA_scg PA_rp],'-*r','LineWidth',2,'Markersize',7)
set(gca,'XtickLabel',{ 'Experimental '  ' ' 'ANN-BFG' ' ' 'ANN-SCG' ' ' 'ANN-RP'})
set(gca,'fontweight','bold')
ylabel('Peak Acceleration')



else
 PA_bfg= 0;
set(handles.edit6,'String',num2str(PA_bfg))   

PA_scg= 0;
set(handles.edit7,'String',num2str(PA_scg))

PA_rp= 0;
set(handles.edit8,'String',num2str(PA_rp))
end

clear num txt raw Ind 

%% Pead Displacement

[num txt raw] = xlsread('Data.xlsx',2);

Ind = [];
for i = 1 : size(num,1)
      if isequal(num(i,1:2),[F H])
          Ind = i;
          break;
      end
end

if ~isempty(Ind )
load(['PD_netbfg.mat'])
PD_bfg= abs(sim(net,Input'));
set(handles.edit3,'String',num2str(PD_bfg))

load(['PD_netscg.mat'])
PD_scg= abs(sim(net,Input'));
set(handles.edit4,'String',num2str(PD_scg))

load(['PD_netrp.mat'])
PD_rp= abs(sim(net,Input'));
set(handles.edit5,'String',num2str(PD_rp))

Er = [abs(num(Ind,3)-PD_bfg) abs(num(Ind,3)-PD_scg) abs(num(Ind,3)-PD_rp)];
figure,
hold on
grid on
bar(1,Er(1),0.5,'r')
bar(2,Er(2),0.5,'g')
bar(3,Er(3),0.5,'b')
set(gca,'XtickLabel',{ ' ' 'ANN-BFG' ' ' 'ANN-SCG' ' ' 'ANN-RP'})
set(gca,'fontweight','bold')
ylabel('Error')
title('Peak Displacement')


figure,
plot([num(Ind,3) PD_bfg PD_scg PD_rp],'-*r','LineWidth',2,'Markersize',7)
set(gca,'XtickLabel',{ 'Experimental '  ' ' 'ANN-BFG' ' ' 'ANN-SCG' ' ' 'ANN-RP'})
set(gca,'fontweight','bold')
ylabel('Peak Displacement')

else
 PD_bfg= 0;
set(handles.edit3,'String',num2str(PD_bfg))   

PD_scg= 0;
set(handles.edit4,'String',num2str(PD_scg))

PD_rp= 0;
set(handles.edit5,'String',num2str(PD_rp))
end

clear num raw txt Ind
%% POWER

[num txt raw] = xlsread('Data.xlsx',3);

Ind = [];
for i = 1 : size(num,1)
      if isequal(num(i,1:2),[F H])
          Ind = i;
          break;
      end
end

if ~isempty(Ind )
load(['POW_netbfg.mat'])
POW_bfg= abs(sim(net,Input'));
set(handles.edit9,'String',num2str(POW_bfg))

load(['POW_netscg.mat'])
POW_scg= abs(sim(net,Input'));
set(handles.edit10,'String',num2str(POW_scg))

load(['POW_netrp.mat'])
POW_rp= abs(sim(net,Input'));
set(handles.edit11,'String',num2str(POW_rp))

Er = [abs(num(Ind,3)-POW_bfg) abs(num(Ind,3)-POW_scg) abs(num(Ind,3)-POW_rp)];
figure,
hold on
grid on
bar(1,Er(1),0.5,'r')
bar(2,Er(2),0.5,'g')
bar(3,Er(3),0.5,'b')
set(gca,'XtickLabel',{ ' ' 'ANN-BFG' ' ' 'ANN-SCG' ' ' 'ANN-RP'})
set(gca,'fontweight','bold')
ylabel('Error')
title('POWER')


figure,
plot([num(Ind,3) POW_bfg POW_scg POW_rp],'-*r','LineWidth',2,'Markersize',7)
set(gca,'XtickLabel',{ 'Experimental '  ' ' 'ANN-BFG' ' ' 'ANN-SCG' ' ' 'ANN-RP'})
set(gca,'fontweight','bold')
ylabel('Power')

else
 POW_bfg= 0;
set(handles.edit9,'String',num2str(POW_bfg))   

POW_scg= 0;
set(handles.edit10,'String',num2str(POW_scg))

POW_rp= 0;
set(handles.edit11,'String',num2str(POW_rp))
end

clear num raw txt Ind
%% STIFFNESS

[num txt raw] = xlsread('Data.xlsx',4);

Ind = [];
for i = 1 : size(num,1)
      if isequal(num(i,1:2),[F H])
          Ind = i;
          break;
      end
end

if ~isempty(Ind )
load(['STIF_netbfg.mat'])
STIF_bfg= abs(sim(net,Input'));
set(handles.edit12,'String',num2str(STIF_bfg))

load(['STIF_netscg.mat'])
STIF_scg= abs(sim(net,Input'));
set(handles.edit13,'String',num2str(STIF_scg))

load(['STIF_netrp.mat'])
STIF_rp= abs(sim(net,Input'));
set(handles.edit14,'String',num2str(STIF_rp))

Er = [abs(num(Ind,3)-STIF_bfg) abs(num(Ind,3)-STIF_scg) abs(num(Ind,3)-STIF_rp)];
figure,
hold on
grid on
bar(1,Er(1),0.5,'r')
bar(2,Er(2),0.5,'g')
bar(3,Er(3),0.5,'b')
ylabel('Error')
title('STIFFNESS')
set(gca,'XtickLabel',{ ' ' 'ANN-BFG' ' ' 'ANN-SCG' ' ' 'ANN-RP'})
set(gca,'fontweight','bold')


figure,
plot([num(Ind,3) STIF_bfg STIF_scg STIF_rp],'-*r','LineWidth',2,'Markersize',7)
set(gca,'XtickLabel',{ 'Experimental '  ' ' 'ANN-BFG' ' ' 'ANN-SCG' ' ' 'ANN-RP'})
set(gca,'fontweight','bold')
ylabel('Stiffness')

else
 STIF_bfg= 0;
set(handles.edit12,'String',num2str(STIF_bfg))   

STIF_scg= 0;
set(handles.edit13,'String',num2str(STIF_scg))

STIF_rp= 0;
set(handles.edit14,'String',num2str(STIF_rp))
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
clear all
close all


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
