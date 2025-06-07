function [pcaA V] = PCA( A, k )
% PCA主成分分析              也可以用matlab自带的库函数pca()
%
% 输入：A --- 样本矩阵，每行为一个样本
%      k --- 降维至 k 维
%
% 输出：pcaA --- 降维后的 k 维样本特征向量组成的矩阵，每行一个样本，列数 k 为降维后的样本特征维数
%       V --- 主成分向量

[row col] = size(A);

% step1:去除平均值
meanA = mean(A);
meanVec = A - meanA;

% step2:求协方差矩阵
conVec = meanVec'*meanVec/row;

% step3:计算协方差矩阵的前k个特征值和特征向量V
[V D] = eigs(conVec, k);

% step4:特征向量归一化为单位特征向量，利用欧氏距离函数norm（平方和开根号）
for i=1:k
    V(:,i)=V(:,i)/norm(V(:,i));
end

% step5:将原始特征投影到选取的特征向量上
pcaA = meanVec * V;

% % 保存变换矩阵 V 和变换原点 meanVec
% save('Mat/PCA.mat', 'V', 'meanVec');