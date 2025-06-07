function [ model ] =multiSVMtrain(traindata, trainlabel)
%多类别的SVM训练器
%     model=svmtrain(trainlabel,traindata,'-c  9.53674316406e-07 -g 4.0');
    model=svmtrain(trainlabel,traindata,'-c  100 -g 2.0');
end