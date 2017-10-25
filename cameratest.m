function varargout = cameratest(varargin)
% CAMERATEST MATLAB code for cameratest.fig
%      CAMERATEST, by itself, creates a new CAMERATEST or raises the existing
%      singleton*.
%
%      H = CAMERATEST returns the handle to a new CAMERATEST or the handle to
%      the existing singleton*.
%
%      CAMERATEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAMERATEST.M with the given input arguments.
%
%      CAMERATEST('Property','Value',...) creates a new CAMERATEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cameratest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cameratest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cameratest

% Last Modified by GUIDE v2.5 06-Oct-2017 18:41:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cameratest_OpeningFcn, ...
                   'gui_OutputFcn',  @cameratest_OutputFcn, ...
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


% --- Executes just before cameratest is made visible.
function cameratest_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cameratest (see VARARGIN)

% Choose default command line output for cameratest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cameratest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cameratest_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(~, ~, ~)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global  vid
 
 vid=videoinput('winvideo',1);
 set(vid, 'returnedcolorspace','RGB');
 preview(vid);
 

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(~, ~, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
[fname, path]=uigetfile( {'*.jpg'; '*.bmp';'*.png'},'File selector');
fname=strcat(path, fname);
image =imread(fname);
axes(handles.axes1);
imshow(image);
title('INPUT IMAGE');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(~, ~, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
%A = imread(mi);
%y= rgb2gray(A);
%x=gray2bw(y);
%%y=rgb2gray(im);
FaceDetector = vision.CascadeObjectDetector();
FaceDetector.MergeThreshold = 7;
BBOX = step (FaceDetector, image);
B = insertObjectAnnotation(image, 'rectangle', BBOX, 'abcd');
axes(handles.axes1);
imshow(B);
title('Detected Faces')
%imshow(im);

n=size(BBOX, 1);
str_n = num2str(n);
str = strcat('Number of detected faces are ', str_n);
msgbox(str);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(~, ~, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global image vid
 counter=1;
 image = getsnapshot(vid);
 axes(handles.axes1);
 imshow(image)
 savename = strcat('C:\Users\john toppo\Documents\testimage_' , num2str(counter),'.jpg');
 imwrite(image, savename);
 %imwrite(image,'C:\Users\john toppo\Documents\testimage_' , num2str(counter),'.jpg');
 counter = counter + 1;
 
 


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(~, ~, ~)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image  BBOX n 

    
   %for i = 1:n
       
   %faceimage = imcrop(image, BBOX(i,:));
   %figure;
   %imshow(faceimage);
   
   
   
   
  % end
   
   
      h = figure;  
    for i = 1:n
      
    j = imcrop(image, BBOX(i,:));
    
     figure(h);
    subplot(2,2,i);
   
     imshow(j);
    
   
    end
  % hold off 
   
   


clear all
clc

FaceDetector = vision.CascadeObjectDetector();


FaceDetector.MergeThreshold = 7;
BBOX = step (FaceDetector, image);
B = insertObjectAnnotation(image, 'rectangle', BBOX, 'abcd');
axes(handles.axes1);
imshow(B);
title('Detected Faces')
 





