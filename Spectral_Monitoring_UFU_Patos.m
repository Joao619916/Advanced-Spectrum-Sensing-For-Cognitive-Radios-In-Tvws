%% Defines for SOC communication Note: in the final version the reading will be
%% Authors: João Victor Fernandes Borges and André Antônio dos Anjos

function varargout = Spectral_Monitoring_UFU_Patos(varargin)
% SPECTRAL_MONITORING_UFU_PATOS MATLAB code for Spectral_Monitoring_UFU_Patos.fig
%      SPECTRAL_MONITORING_UFU_PATOS, by itself, creates a new SPECTRAL_MONITORING_UFU_PATOS or raises the existing
%      singleton*.
%
%      H = SPECTRAL_MONITORING_UFU_PATOS returns the handle to a new SPECTRAL_MONITORING_UFU_PATOS or the handle to
%      the existing singleton*.
%
%      SPECTRAL_MONITORING_UFU_PATOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPECTRAL_MONITORING_UFU_PATOS.M with the given input arguments.
%
%      SPECTRAL_MONITORING_UFU_PATOS('Property','Value',...) creates a new SPECTRAL_MONITORING_UFU_PATOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Spectral_Monitoring_UFU_Patos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Spectral_Monitoring_UFU_Patos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help Spectral_Monitoring_UFU_Patos

% Last Modified by GUIDE v2.5 07-May-2026 13:33:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Spectral_Monitoring_UFU_Patos_OpeningFcn, ...
                   'gui_OutputFcn',  @Spectral_Monitoring_UFU_Patos_OutputFcn, ...
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


% --- Executes just before Spectral_Monitoring_UFU_Patos is made visible.
function Spectral_Monitoring_UFU_Patos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Spectral_Monitoring_UFU_Patos (see VARARGIN)

% Choose default command line output for Spectral_Monitoring_UFU_Patos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Spectral_Monitoring_UFU_Patos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Spectral_Monitoring_UFU_Patos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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
function  pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset');
global rx;

% %% USRP configured parameters
% Duration = 30;
% %Initial parameters
% CenterFrequency = 473.142857e6;
% LocalOscillatorOffset = 0;
% MasterClockRate = 100e6;
% TransportDataType = 'int8';
% DecimationRxInterpolationTxFactor = 16;
% SamplesPerFrame  = 2^15; 
% EnableBurstMode  = 1;
% NumFramesInBurst = 1;
% Gain = str2num(get(handles.edit2,'String'));
% IP_USRP = get(handles.edit1,'String');
% %Derived parameters
% SampleRate = MasterClockRate/DecimationRxInterpolationTxFactor;
% FrameDuration = SamplesPerFrame/SampleRate;
% 
% set(handles.edit3,'String','Connecting to the Radio');
% %% Creating rx object
% rx = comm.SDRuReceiver('Platform','N200/N210/USRP2', ...
%                 'IPAddress', IP_USRP, ...
%                 'CenterFrequency',CenterFrequency, ...
%                 'LocalOscillatorOffset',LocalOscillatorOffset, ...
%                 'Gain', Gain,...
%                'MasterClockRate',MasterClockRate, ...
%                'DecimationFactor',DecimationRxInterpolationTxFactor, ...
%                'TransportDataType',TransportDataType, ...
%                'SamplesPerFrame',SamplesPerFrame, ...
%                'EnableBurstMode',EnableBurstMode, ...
%                'NumFramesInBurst',NumFramesInBurst, ...
%                'OutputDataType','single');
%            
% set(handles.edit3,'String','Radio connected');

%% Loop configurations
Limiar = str2double(get(handles.edit4,'String'));
N = str2double(get(handles.edit8,'String'));
Channel_min = str2double(get(handles.edit6,'String'));
Channel_max = str2double(get(handles.edit7,'String'));

Channel = Channel_min;
Monitoring_Vector = Channel_min:1:Channel_max;
Channel_Decision = zeros(1,length(Monitoring_Vector));
T_channel_vector = zeros(1,length(Monitoring_Vector));

set(handles.edit3,'String','Sensing UHF channels');
tic

while 1
    %% Monitoring sensed channel
    rx.CenterFrequency = 473.142857e6+(Channel-14)*6e6;
    pause(0.001)
    [data, ~, overrun]  = step(rx);
    T = sum(abs(data(1:N)).^2); % Modified here. Needs testing.
    
    if T > Limiar
        Channel_Decision(Channel-Channel_min+1) = 1;
    else
       Channel_Decision(Channel-Channel_min+1) = 0; 
    end
    
    T_channel_vector(Channel-Channel_min+1) = T;
    
        
    %% Incrementing Channel
     if Channel == Channel_max
         Channel = Channel_min;
            axes(handles.axes1);
            bar(Monitoring_Vector,Channel_Decision,'r');
            xlabel('UHF Channels');
            ylabel('Channel occupation');
    
            axes(handles.axes2);
            bar(Monitoring_Vector,T_channel_vector)
            xlabel('UHF Channels')
            ylabel('Energy')
            toc
            tic
  
         
     else
         Channel = Channel + 1;
     end
     
%     axes(handles.axes1);
%     bar(Monitoring_Vector,Channel_Decision,'r');
%     xlabel('UHF Channels');
%     ylabel('Channel occupation');
%     
%     axes(handles.axes2);
%     bar(Monitoring_Vector,T_channel_vector)
%     xlabel('UHF Channels')
%     ylabel('Energy')
    
    Limiar = str2double(get(handles.edit4,'String'));
    
    drawnow
	if get(handles.pushbutton2, 'userdata') % stop condition
        set(handles.edit3,'String','Sensing UHF channels stopped');
        cla(handles.axes1,'reset');
        set(handles.pushbutton2,'userdata',0)
		break;
	end
    
%     if a == 1
%         break;
%         a = 0;
%     end
%      
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.edit3,'String','Sensing UHF channels stopped');
cla(handles.axes1,'reset');
cla(handles.axes2,'reset');
set(handles.pushbutton2,'userdata',1)


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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rx;

%% USRP configured parameters
Duration = 30;
%Initial parameters
CenterFrequency = 473.142857e6;
LocalOscillatorOffset = 0;
MasterClockRate = 100e6;
TransportDataType = 'int8';
DecimationRxInterpolationTxFactor = 16;
SamplesPerFrame  = 2^15; 
EnableBurstMode  = 1;
NumFramesInBurst = 1;
Gain = str2num(get(handles.edit2,'String'));
IP_USRP = get(handles.edit1,'String');
%Derived parameters
SampleRate = MasterClockRate/DecimationRxInterpolationTxFactor;
FrameDuration = SamplesPerFrame/SampleRate;

set(handles.edit3,'String','Connecting to the Radio');

%% Creating rx object
rx = comm.SDRuReceiver('Platform','N200/N210/USRP2', ...
                'IPAddress', IP_USRP, ...
                'CenterFrequency',CenterFrequency, ...
                'LocalOscillatorOffset',LocalOscillatorOffset, ...
                'Gain', Gain,...
               'MasterClockRate',MasterClockRate, ...
               'DecimationFactor',DecimationRxInterpolationTxFactor, ...
               'TransportDataType',TransportDataType, ...
               'SamplesPerFrame',SamplesPerFrame, ...
               'EnableBurstMode',EnableBurstMode, ...
               'NumFramesInBurst',NumFramesInBurst, ...
               'OutputDataType','single');
           
set(handles.edit3,'String','Radio connected');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rx
release(rx)
set(handles.edit3,'String','Radio disconnected');


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
