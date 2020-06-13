function varargout = Car_gui(varargin)
% CAR_GUI MATLAB code for Car_gui.fig
%      CAR_GUI, by itself, creates a new CAR_GUI or raises the existing
%      singleton*.
%
%      H = CAR_GUI returns the handle to a new CAR_GUI or the handle to
%      the existing singleton*.
%
%      CAR_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAR_GUI.M with the given input arguments.
%
%      CAR_GUI('Property','Value',...) creates a new CAR_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Car_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Car_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Car_gui

% Last Modified by GUIDE v2.5 02-Feb-2020 16:22:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Car_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Car_gui_OutputFcn, ...
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


% --- Executes just before Car_gui is made visible.
function Car_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Car_gui (see VARARGIN)

global mode;
mode=0;
% Choose default command line output for Car_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Car_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Car_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global MotorOne_t1;
global MotorOne_t2;

global MotorTwo_t1;
global MotorTwo_t2;
% Get default command line output from handles structure
varargout{1} = handles.output;


clc;
% opening the simulink model file 
open_system('car_simulink.slx');
% setting the simulation mode to external
set_param('car_simulink', 'SimulationMode', 'external');
% starting the simulation when the GUI intializes 
set_param('car_simulink','SimulationCommand','start');

MotorOne_t1 = 0;
MotorOne_t2 = 0;
MotorTwo_t1 = 0;
MotorTwo_t2 = 0;

set_param('car_simulink/Motor1_p', 'Value', num2str(MotorOne_t1));
set_param('car_simulink/Motor1_n', 'Value', num2str(MotorOne_t2));
set_param('car_simulink/Motor2_p', 'Value', num2str(MotorTwo_t1));
set_param('car_simulink/Motor2_n', 'Value', num2str(MotorTwo_t2));
set_param('car_simulink','SimulationCommand','Update');




% --- Executes on button press in forward_button.
function forward_button_Callback(hObject, eventdata, handles)
% hObject    handle to forward_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MotorOne_t1;
global MotorOne_t2;

global MotorTwo_t1;
global MotorTwo_t2;

MotorOne_t1 = 5;
MotorOne_t2 = 0;

MotorTwo_t1 = 5;
MotorTwo_t2 = 0;

set_param('car_simulink/Motor1_p', 'Value', num2str(MotorOne_t1));
set_param('car_simulink/Motor1_n', 'Value', num2str(MotorOne_t2));

set_param('car_simulink/Motor2_p', 'Value', num2str(MotorTwo_t1));
set_param('car_simulink/Motor2_n', 'Value', num2str(MotorTwo_t2));
set_param('car_simulink','SimulationCommand','Update');



% --- Executes on button press in right_button.
function right_button_Callback(hObject, eventdata, handles)
% hObject    handle to right_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MotorOne_t1;
global MotorOne_t2;

global MotorTwo_t1;
global MotorTwo_t2;

MotorOne_t1 = 5;
MotorOne_t2 = 0;

MotorTwo_t1 = 0;
MotorTwo_t2 = 0;

set_param('car_simulink/Motor1_p', 'Value', num2str(MotorOne_t1));
set_param('car_simulink/Motor1_n', 'Value', num2str(MotorOne_t2));

set_param('car_simulink/Motor2_p', 'Value', num2str(MotorTwo_t1));
set_param('car_simulink/Motor2_n', 'Value', num2str(MotorTwo_t2));
set_param('car_simulink','SimulationCommand','Update');


% --- Executes on button press in back_buttom.
function back_buttom_Callback(hObject, eventdata, handles)
% hObject    handle to back_buttom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MotorOne_t1;
global MotorOne_t2;

global MotorTwo_t1;
global MotorTwo_t2;

MotorOne_t1 = 0;
MotorOne_t2 = 5;

MotorTwo_t1 = 0;
MotorTwo_t2 = 5;

set_param('car_simulink/Motor1_p', 'Value', num2str(MotorOne_t1));
set_param('car_simulink/Motor1_n', 'Value', num2str(MotorOne_t2));

set_param('car_simulink/Motor2_p', 'Value', num2str(MotorTwo_t1));
set_param('car_simulink/Motor2_n', 'Value', num2str(MotorTwo_t2));
set_param('car_simulink','SimulationCommand','Update');


% --- Executes on button press in left_button.
function left_button_Callback(hObject, eventdata, handles)
% hObject    handle to left_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MotorOne_t1;
global MotorOne_t2;

global MotorTwo_t1;
global MotorTwo_t2;

MotorOne_t1 = 0;
MotorOne_t2 = 0;

MotorTwo_t1 = 5;
MotorTwo_t2 = 0;

set_param('car_simulink/Motor1_p', 'Value', num2str(MotorOne_t1));
set_param('car_simulink/Motor1_n', 'Value', num2str(MotorOne_t2));

set_param('car_simulink/Motor2_p', 'Value', num2str(MotorTwo_t1));
set_param('car_simulink/Motor2_n', 'Value', num2str(MotorTwo_t2));
set_param('car_simulink','SimulationCommand','Update');


% --- Executes on button press in stop_button.
function stop_button_Callback(hObject, eventdata, handles)
% hObject    handle to stop_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global MotorOne_t1;
global MotorOne_t2;

global MotorTwo_t1;
global MotorTwo_t2;

MotorOne_t1 = 0;
MotorOne_t2 = 0;

MotorTwo_t1 = 0;
MotorTwo_t2 = 0;

set_param('car_simulink/Motor1_p', 'Value', num2str(MotorOne_t1));
set_param('car_simulink/Motor1_n', 'Value', num2str(MotorOne_t2));

set_param('car_simulink/Motor2_p', 'Value', num2str(MotorTwo_t1));
set_param('car_simulink/Motor2_n', 'Value', num2str(MotorTwo_t2));
set_param('car_simulink','SimulationCommand','Update');


% --- Executes on button press in auto_button.
function auto_button_Callback(hObject, eventdata, handles)
% hObject    handle to auto_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode;

if mode == 0 
    mode =1;
    set_param('car_simulink/const_auto','Value',num2str(mode));
    set_param('car_simulink','SimulationCommand','Update');
    set(handles.mode_disp,'String','Automatic');
    set(handles.auto_button,'String','Manual');
else
    mode =0;    
    set_param('car_simulink/const_auto','Value',num2str(mode));
    set_param('car_simulink','SimulationCommand','Update');
    set(handles.mode_disp,'String','Manual');
    set(handles.auto_button,'String','Automatic');
end

    
