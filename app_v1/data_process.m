function dir_cell = data_process()
%本函数的作用是将杂乱无章的原始数据集进行人脸检测后重新存放,用了很大部分工作量在这部分内容上!所以同学们以后命名应该统一！！
    FilePath  = ["srcData\2021明月\2021明月" "srcData\2022明月一班照片\2022明月一班照片\明月一班照片" "srcData\2022明月二班照片\2022明月二班照片"];
%     stImageSavePath  = 'dstData\';
    arr_count = 1;
    for fil = 1:3
        par_Path = FilePath(fil);                   %父文件夹
        dir_class_PathList = dir(par_Path);        %读取该目录下全部图片的路径（字符串格式）
        i_class_Num  = length(dir_class_PathList);                    %获取文件夹的总数
        for i = 3:i_class_Num
            par_Path = FilePath(fil);                   %父文件夹
            arr_name = dir_class_PathList(i).name;
            filename = arr_name;
            tempPath = strcat(par_Path,'\',filename);
            temp_PathList = dir(tempPath);
            while isfolder(strcat(tempPath,'\',temp_PathList(1).name))&&isfolder(strcat(tempPath,'\',temp_PathList(2).name))&&isfolder(strcat(tempPath,'\',temp_PathList(3).name))
                filename = temp_PathList(3).name;
                par_Path = tempPath;
                tempPath = strcat(par_Path,'\',filename);
                temp_PathList = dir(tempPath);
            end
            stImageSavePath = strcat('dstData\',int2str(arr_count));
            dir_cell{arr_count} = arr_name;
            arr_count = arr_count+1;
            mkdir(stImageSavePath);
            temp_Num = length(temp_PathList);
            counts = 1;
            for j = 1:12
                minj = min(j,temp_Num);
                if temp_PathList(minj).isdir == 0
                    iSaveNum      = int2str(counts);
                    stImagePath   = temp_PathList(minj).name;
                    mImageCurrent = uint8(imread(strcat(tempPath,'\',stImagePath)));
                    mFaceResult   = face_judge(mImageCurrent);                  %人脸识别截取后的图片，可用于进一步处理
                    if  isrgb(mFaceResult) == 1
                        mFaceResult   = rgb2gray(mFaceResult);
                    end
                    imwrite(mFaceResult,strcat(stImageSavePath,'\',iSaveNum,'.jpg'));
                    counts = counts+1;
                end
            end
        end 
    end
    save('dir_cell',dir_cell,'-mat');
end