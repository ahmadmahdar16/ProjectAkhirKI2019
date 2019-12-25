function varargout = Region(varargin)
% REGION MATLAB code for Region.fig
%      REGION, by itself, creates a new REGION or raises the existing
%      singleton*.
%
%      H = REGION returns the handle to a new REGION or the handle to
%      the existing singleton*.
%
%      REGION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGION.M with the given input arguments.
%
%      REGION('Property','Value',...) creates a new REGION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Region_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Region_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Region

% Last Modified by GUIDE v2.5 23-Dec-2019 14:40:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Region_OpeningFcn, ...
                   'gui_OutputFcn',  @Region_OutputFcn, ...
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


% --- Executes just before Region is made visible.
function Region_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Region (see VARARGIN)

% Choose default command line output for Region
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(hObject,'center');
clc;clear;

% UIWAIT makes Region wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Region_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.*'});
 
if ~isequal(filename,0)
    Info = imfinfo(fullfile(pathname,filename));
    if Info.BitDepth == 1
        msgbox('Citra masukan harus citra RGB atau Grayscale');
        return
    elseif Info.BitDepth == 8
        Img = imread(fullfile(pathname,filename));
        axes(handles.axes1)
        cla('reset')
        imshow(Img)
        title('Gambar Awal')
    else
        Img = rgb2gray(imread(fullfile(pathname,filename)));
        axes(handles.axes1)
        cla('reset')
        imshow(Img)
        title('Gambar Awal')
    end
else
    return
end

handles.Img = Img;
guidata(hObject,handles);
 
set(handles.radiobutton1,'Enable','on')
set(handles.radiobutton2,'Enable','on')
set(handles.radiobutton3,'Enable','on')
set(handles.radiobutton4,'Enable','on')
set(handles.radiobutton5,'Enable','on')
set(handles.radiobutton6,'Enable','on')
set(handles.radiobutton7,'Enable','on')
axes(handles.axes2)
cla('reset')
set(gca,'XTick',[])
set(gca,'YTick',[])
axes(handles.axes3)
cla('reset')
set(gca,'XTick',[])
set(gca,'YTick',[])
axes(handles.axes4)
cla('reset')
set(gca,'XTick',[])
set(gca,'YTick',[])

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'Value',1)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
 
Img = handles.Img;
I_adjust = imadjust(Img);
 
axes(handles.axes1)
cla('reset')
imshow(Img)
colormap(handles.axes1,'gray')
title('Gambar Original')
 
axes(handles.axes2)
h = histogram(Img(:));
h.FaceColor = [0.5 0.5 0.5];
xlim([0 255])
grid on
title('Histogram')
 
axes(handles.axes3)
cla('reset')
imshow(I_adjust)
colormap(handles.axes3,'gray')
title('Hasil Intensitas Gambar Setelah Ditambahkan Kontras')
 
axes(handles.axes4)
h = histogram(I_adjust(:));
h.FaceColor = [0.5 0.5 0.5];
xlim([0 255])
grid on
title('Histogram')

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',1)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
 
Img = handles.Img;
I_adjust = imadjust(Img,[0 1],[0.2 0.8]);
 
axes(handles.axes1)
cla('reset')
imshow(Img)
colormap(handles.axes1,'gray')
title('Gambar Original')
 
axes(handles.axes2)
h = histogram(Img(:));
h.FaceColor = [0.5 0.5 0.5];
xlim([0 255])
grid on
title('Histogram')
 
axes(handles.axes3)
cla('reset')
imshow(I_adjust)
colormap(handles.axes3,'gray')
title('Hasil Intensitas Gambar Setelah Ditambahkan Kontras')
 
axes(handles.axes4)
h = histogram(I_adjust(:));
h.FaceColor = [0.5 0.5 0.5];
xlim([0 255])
grid on
title('Histogram')

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',1)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
 
Img = handles.Img;
I_adjust = histeq(Img);
 
axes(handles.axes1)
cla('reset')
imshow(Img)
colormap(handles.axes1,'gray')
title('Gambar Original')
 
axes(handles.axes2)
h = histogram(Img(:));
h.FaceColor = [0.5 0.5 0.5];
xlim([0 255])
grid on
title('Histogram')
 
axes(handles.axes3)
cla('reset')
imshow(I_adjust)
colormap(handles.axes3,'gray')
title('Hasil Intensitas Gambar Setelah Ditambahkan Kontras')
 
axes(handles.axes4)
h = histogram(I_adjust(:));
h.FaceColor = [0.5 0.5 0.5];
xlim([0 255])
grid on
title('Histogram')
 
% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',1)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
 
Img = handles.Img;
lpf1 = [1/16 1/8 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];
lpf2 = [1/10 1/10 1/10; 1/10 1/5 1/10; 1/10 1/10 1/10];
lpf3 = [1 1 1; 1 1 1; 1 1 1]/9;
J1 = uint8(conv2(double(Img),lpf1,'same'));
J2 = uint8(conv2(double(Img),lpf2,'same'));
J3 = uint8(conv2(double(Img),lpf3,'same'));
 
axes(handles.axes1)
cla('reset')
imshow(Img)
colormap(handles.axes1,'gray')
title('Gambar Original')
 
axes(handles.axes2)
cla('reset')
imshow(J1)
colormap(handles.axes2,'gray')
title('LPF using kernel 1')
 
axes(handles.axes3)
cla('reset')
imshow(J2)
colormap(handles.axes3,'gray')
title('LPF using kernel 2')
 
axes(handles.axes4)
cla('reset')
imshow(J3)
colormap(handles.axes4,'gray')
title('LPF using kernel 3')

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',1)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
 
Img = handles.Img;
hpf1 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
hpf2 = [0 -1 0; -1 5 -1; 0 -1 0];
hpf3 = [1 -2 1; -2 5 -2; 1 -2 1];
J1 = uint8(conv2(double(Img),hpf1,'same'));
J2 = uint8(conv2(double(Img),hpf2,'same'));
J3 = uint8(conv2(double(Img),hpf3,'same'));
 
axes(handles.axes1)
cla('reset')
imshow(Img)
colormap(handles.axes1,'gray')
title('Gambar Original')
 
axes(handles.axes2)
cla('reset')
imshow(J1)
colormap(handles.axes2,'gray')
title('Hasil Final Region Growing')
 
axes(handles.axes3)
cla('reset')
imshow(J2)
colormap(handles.axes3,'gray')
title('Hasil Region Growing Step 1')
 
axes(handles.axes4)
cla('reset')
imshow(J3)
colormap(handles.axes4,'gray')
title('Hasil Region Growing Step 2')

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hint: get(hObject,'Value') returns toggle state of radiobutton6

 
% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hint: get(hObject,'Value') returns toggle state of radiobutton7

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName, PathName] = uiputfile('*.bmp', 'hasilpenambahankontras');
Name = fullfile(PathName,FileName);
F=getframe(handles.axes3);
W=frame2im(F);
imwrite(W, Name, 'tif');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName, PathName] = uiputfile('*.bmp', 'hasilakhirregiongrowing');
Name = fullfile(PathName,FileName);
F=getframe(handles.axes2);
W=frame2im(F);
imwrite(W, Name, 'tif');
