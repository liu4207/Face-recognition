function [data,label] = ReadFace(npersons , flag)
%读取ORL人脸库照片里的数据到矩阵
%输入：
%     nPersons-需要读入的人数,每个人的前八幅图为训练样本，后两幅为验证样本
%     imgrow-图像的行像素为全局变量
%     imgcol-图像的列像素为全局变量
%     flag-标志，为0表示读入训练样本，为1表示读入测试样本
%输出：
%已知全局变量：imgrow=56; imgcol=46;
imgrow = 56;
imgcol = 46;
if flag
    nump = 2;       %读入2人数，测试集
else
    nump = 8;       %读入8人，训练集
end
label=zeros(npersons*nump,1);
data=zeros(npersons*nump,imgrow*imgcol);
for i=1:npersons
    facepath='ORL56_46\orl';
    facepath=strcat(facepath,num2str(i));
    facepath=strcat(facepath,'_');
    cachepath=facepath;
    for j=1:nump
        facepath=cachepath;
        if flag==0 %读入训练样本图像的数据
            facepath=strcat(facepath,num2str(j));
            label((i-1)*nump+j)=i;                     %对40个样本进行标号
        else %读入测试样本数据
            facepath=strcat(facepath,num2str(j+8));
            label((i-1)*nump+j)=i;                     %对40个样本进行标号
        end
        facepath=strcat(facepath,'.bmp');
        img=imread(facepath);
        data((i-1)*nump+j,:)=img(:)';
    end
end
end