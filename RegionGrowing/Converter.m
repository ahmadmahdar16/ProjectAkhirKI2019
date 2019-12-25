function varargout = Converter(varargin)
% CONVERTER MATLAB code for Converter.fig
%      CONVERTER, by itself, creates a new CONVERTER or raises the existing
%      singleton*.
%
%      H = CONVERTER returns the handle to a new CONVERTER or the handle to
%      the existing singleton*.
%
%      CONVERTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONVERTER.M with the given input arguments.
%
%      CONVERTER('Property','Value',...) creates a new CONVERTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Converter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Converter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Converter

% Last Modified by GUIDE v2.5 23-Dec-2019 14:43:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Converter_OpeningFcn, ...
                   'gui_OutputFcn',  @Converter_OutputFcn, ...
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


% --- Executes just before Converter is made visible.
function Converter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Converter (see VARARGIN)

% Choose default command line output for Converter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(hObject,'center');

% UIWAIT makes Converter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Converter_OutputFcn(hObject, eventdata, handles) 
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
[filename, pathname] = uigetfile({'*.*'});
 
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    info = imfinfo(fullfile(pathname,filename));
    bitdepth = info.BitDepth;
    if bitdepth ==24
        axes(handles.axes1)
        imshow(Img)
        set(handles.popupmenu1,'enable','on')
        set(handles.popupmenu1,'Value',1)
    else
        errordlg('Image must be RGB','File Error');
    end
else
    return
end
 
handles.Img = Img;
guidata(hObject, handles);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
Img = handles.Img;
val = get(hObject,'Value');
 
switch val
    case 1
        axes(handles.axes1)
        imshow(Img)
        R = Img(:,:,1);
        axes(handles.axes2)
        imshow(R)
        axes(handles.axes5)
        imhist(R)
        G = Img(:,:,2);
        axes(handles.axes3)
        imshow(G)
        axes(handles.axes6)
        imhist(G)
        B = Img(:,:,3);
        axes(handles.axes4)
        imshow(B)
        axes(handles.axes7)
        imhist(B)
    case 2
        HSV = rgb2hsv(Img);
        axes(handles.axes1)
        imshow(HSV)
        H = HSV(:,:,1);
        axes(handles.axes2)
        imshow(H)
        axes(handles.axes5)
        imhist(H)
        S = HSV(:,:,2);
        axes(handles.axes3)
        imshow(S)
        axes(handles.axes6)
        imhist(S)
        V = HSV(:,:,3);
        axes(handles.axes4)
        imshow(V)
        axes(handles.axes7)
        imhist(V)
    case 3
        NTSC = rgb2ntsc(Img);
        axes(handles.axes1)
        imshow(NTSC)
        Y = NTSC(:,:,1);
        axes(handles.axes2)
        imshow(Y)
        axes(handles.axes5)
        imhist(Y)
        I = NTSC(:,:,2);
        axes(handles.axes3)
        imshow(I)
        axes(handles.axes6)
        imhist(I)
        Q = NTSC(:,:,3);
        axes(handles.axes4)
        imshow(Q)
        axes(handles.axes7)
        imhist(Q)
    case 4
        YCbCr = rgb2ycbcr(Img);
        axes(handles.axes1)
        imshow(YCbCr)
        Y = YCbCr(:,:,1);
        axes(handles.axes2)
        imshow(Y)
        axes(handles.axes5)
        imhist(Y)
        Cb = YCbCr(:,:,2);
        axes(handles.axes3)
        imshow(Cb)
        axes(handles.axes6)
        imhist(Cb)
        Cr = YCbCr(:,:,3);
        axes(handles.axes4)
        imshow(Cr)
        axes(handles.axes7)
        imhist(Cr)
end

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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName, PathName] = uiputfile('*.jpg','*.tif', 'hasilkonversi');
Name = fullfile(PathName,FileName);
F=getframe(handles.axes1);
W=frame2im(F);
imwrite(W, Name, 'tif');
