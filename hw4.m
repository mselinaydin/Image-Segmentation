function varargout = hw4(varargin)
% HW4 MATLAB code for hw4.fig
%      HW4, by itself, creates a new HW4 or raises the existing
%      singleton*.
%
%      H = HW4 returns the handle to a new HW4 or the handle to
%      the existing singleton*.
%
%      HW4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HW4.M with the given input arguments.
%
%      HW4('Property','Value',...) creates a new HW4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hw4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hw4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hw4

% Last Modified by GUIDE v2.5 03-Jan-2013 20:44:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hw4_OpeningFcn, ...
                   'gui_OutputFcn',  @hw4_OutputFcn, ...
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


% --- Executes just before hw4 is made visible.
function hw4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hw4 (see VARARGIN)

% Choose default command line output for hw4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hw4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global newImage;
global oldImage;
global areaStr;
global methodStr;
% newImage = 0;
% oldImage = 0;
% areaStr = 1;
% methodStr = 1;


% --- Outputs from this function are returned to the command line.
function varargout = hw4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in areaListbox.
function areaListbox_Callback(hObject, eventdata, handles)
% hObject    handle to areaListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns areaListbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from areaListbox
global areaStr;
areaStr = get(hObject, 'Value');



% --- Executes during object creation, after setting all properties.
function areaListbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to areaListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in methodListbox.
function methodListbox_Callback(hObject, eventdata, handles)
% hObject    handle to methodListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns methodListbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from methodListbox
global methodStr;
methodStr = get(hObject, 'Value');



% --- Executes during object creation, after setting all properties.
function methodListbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to methodListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in openImage.
function openImage_Callback(hObject, eventdata, handles)
% hObject    handle to openImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global oldImage;
global newImage;
global imageName;
[filename, pathname] = uigetfile('*.PNG', 'Pick a png file');
imageName = filename;
newImage = 0;
oldImage = imread(filename);
axis(handles.axes1);
image(oldImage,'Parent',handles.axes1);


% --- Executes on button press in compute.
function compute_Callback(hObject, eventdata, handles)
% hObject    handle to compute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global newImage;
global imageName;
global areaStr;
global methodStr;
newImage = computeSegment(imageName, areaStr, methodStr);
axis(handles.axes2);
image(newImage,'Parent',handles.axes2);
