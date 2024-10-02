%% HOMEWORK 4
%a) load the frames of IMG_2033.mov in a variable in the workspace
clear all
close all
clc
vid=VideoReader('IMG_2033.mov');
nFrames=vid.NumFrames;
vidHeight=vid.Height;
vidWidth=vid.Width;

mov(1:nFrames)=struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),'colormap',[]); %object to save frames

for k=1:nFrames
    mov(k).cdata=read(vid,k); %each frame is in mov(k).cdata
end

% b)Once created the mov structure, focus on the R component only
RED(1:nFrames)=struct('cdata',zeros(vidHeight,vidWidth,1,'uint8'),'colormap',[]);
for k=1:nFrames
    RED(k).cdata=mov(k).cdata(:,:,1); %RED is a struct array containing red component of original frame
end

% c) For each pixel position, consider the time series of the
% videointensity in that pixel position, and compute its standard deviation
% attributing it to that pixel position in an output parametric image

RED_STD=zeros(vidHeight,vidWidth); %empty parametric image
A=zeros(1,nFrames); %vector only used in the cycle to record each pixel's time series
for i=1:vidHeight
    for j=1:vidWidth
        for k=1:nFrames
            A(k)=RED(k).cdata(i,j); %pixel's time series
        end
        RED_STD(i,j)=std(A); %each pixel's std throughout the frames is assigned to its coordinates
    end
progressIndication = sprintf('Completed row %4d of %d.', i, vidHeight);
disp(progressIndication);
end

%d) Properly visualize the resulting parametric image

imshow(RED_STD,[]);colormap('turbo'); %turbo colormap is useful to visualize the variations

%The areas that need to be used to extract the heart rate are the top right and bottom right corners