function Params = ImgTransParamsParse(ParamSting,mode)
% Brief:    图像变换参数解析
% Input:    ParamSting  图像变换参数源数据(字符串)
%           mode        图像变换类型
% Output:   Params      解析后的参数
% Usage Sample:         Params = ImgTransParamsParse('100,200','shift')
%                       解析图像平移参数,向右平移100，向上平移200

switch mode
    case    'shift' | 'shear'
        temp = split(ParamSting,',');
        Params = [str2double(temp{1}),str2double(temp{2})];

    case    'zoom' | 'rotate' 
        Params = str2double(ParamSting);
end
       
end