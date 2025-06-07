clear;

stImageFilePath  = '"C:\Users\maziw\Desktop\夏雅雯人脸识别图片\夏雅雯3.jpg"';
stImageSavePath  = '"C:\Users\maziw\Desktop\夏雅雯人脸识别图片';
dirImagePathList = dir(strcat(stImageFilePath,'*.jpg'));        %读取该目录下全部图片的路径（字符串格式）
iImageNum        = length(dirImagePathList);                    %获取图片的总数量
if iImageNum > 0                                                %批量读入图片，进行人脸检測，再批量检測
    for i = 1 : iImageNum
        iSaveNum      = int2str(i);
        stImagePath   = dirImagePathList(i).name;
        mImageCurrent = imread(strcat(stImageFilePath,stImagePath));
        mFaceResult   = face_segment(mImageCurrent);
        imshow(mImageCurrent)
        imwrite(mFaceResult,strcat(stImageSavePath,iSaveNum,'.bmp')); 
    end 
end