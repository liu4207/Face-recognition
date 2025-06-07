clc,clear
npersons=40;%选取40个人的脸
imgrow=56;
imgcol=46;

disp('读取训练数据...')
[traindata , trainlabel]=ReadFace(npersons,0);%读取训练数据
nfaces=size(traindata,1);%样本人脸的数量
disp('.................................................')
%低维空间的图像是(nperson*5)*k的矩阵，每行代表一个主成分脸，每个脸20维特征

disp('训练数据PCA特征提取...')
mA=mean(traindata);
k=10;%降维至20维
[pcatrainface,V]=PCA(traindata,k);%主成分分析法特征提取
disp('.................................................')

disp('显示主成分脸...')
% visualize(V)%显示主分量脸
disp('.................................................')

disp('训练特征数据规范化...')
disp('.................................................')
lowvec=min(pcatrainface);
upvec=max(pcatrainface);
scaledtrainface = scaling( pcatrainface,lowvec,upvec);

disp('SVM样本训练...')
disp('.................................................')
model=multiSVMtrain(scaledtrainface,trainlabel);

disp('读取测试数据...')
disp('.................................................')
[testface,testlabel]=ReadFace(npersons,1);
% img = imread('orl2_9.bmp');
% testface = double(img(:)');

disp('测试数据特征降维...')
disp('.................................................')
m=size(testface,1);
for i=1:m
    testface(i,:)=testface(i,:)-mA;
end
pcatestface=testface*V;

disp('测试特征数据规范化...')
disp('.................................................')
scaledtestface = scaling( pcatestface,lowvec,upvec);

disp('SVM样本分类...')
disp('.................................................')
[pred,accuracy] = multiSVM(scaledtestface,testlabel,model);
% [pred,accuracy] = multiSVM(scaledtestface,2,model);