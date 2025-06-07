%调用摄像头失败时，需要提前安装相关包
% % vidDevice = imaq.VideoDevice('winvideo', 1, 'YUY2_640x480', ...
% %     'ROI', [1 1 640 480], ...
% %     'ReturnedColorSpace', 'rgb' );
% % preview(vidDevice);
% 
faceDetector = vision.CascadeObjectDetector; % 构造检测器
I = imread('..\Data\2021明月\2021明月\陈思念\10.jpg');  %读图
bboxes = step(faceDetector, I); % 开始检测，返回结果到bboxes，[x,y,width,heigth]
% boxe = bboxes(:,3).*bboxes(:,4);
% [~,indexboxes] = max(boxe);
% IFaces = imcrop(I,bboxes(indexboxes,:));
IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, 'Face');
figure, imshow(IFaces), title('Detected faces'); 

% faceDetector = vision.CascadeObjectDetector(); %enable viola jones algorithm
% bbox = [100 100 100 100];
% vidDevice = imaq.VideoDevice('winvideo', 1, 'YUY2_640x480', ...
%     'ROI', [1 1 640 480], ...
%     'ReturnedColorSpace', 'rgb' );
% %set(vidDevice.DeviceProperties, 'FrameRate', '30');
% boxInserter = vision.ShapeInserter('BorderColor','Custom',...
%     'CustomBorderColor',[255 255 0]);
% % textInserter = vision.TextInserter('%d','LocationSource','Input port','Color',[255,255, 0],'FontSize',12);      %需要下载vision包Computer Vision Toolbox
% nFrame =300;
% vidInfo = imaqhwinfo(vidDevice);
% vidHeight = vidInfo.MaxHeight;
% vidWidth = vidInfo.MaxWidth;
% videoPlayer = vision.VideoPlayer('Position',[300 100 640+30 480+30]);
%  
% while 1 % start recording with 300 frames
%     %tic; % timer start
%     videoFrame = step(vidDevice); % enable the image capture by webcam
%     bbox = 4 * faceDetector.step(imresize(videoFrame, 1/4)); % boost video's fps
%     videoOut = step(boxInserter, videoFrame, bbox); % highlight the boxes of face at video
%     %release(boxInserter);
%     step(videoPlayer, videoOut); % display the video live in video player
% end