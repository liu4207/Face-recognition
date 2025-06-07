function [ pred,acc] = multiSVM(testface,testlabel,model)
%对测试数据进行分类
[pred,acc,~] = svmpredict(testlabel, testface, model); 
end