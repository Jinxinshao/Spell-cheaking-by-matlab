function [output] = jianchaciku(input,ecdict)
%JIANCHACIKU 此处显示有关此函数的摘要
%   此处显示详细说明
%   存在返回1，不存在返回0
%ab= size(ecdict);
%a=ab(1);
tic
output=0;

index_zhi=[609,61087,106941,180326,219518,249145,280802,309134,340219,368341,374464,383813,413191,461437,482821,504440,569425,572814,606756,683491,724273,737193,749083,764495,765712,767897,770612];

szm=extractBefore(input,2);

szm1=lower(szm);

cha=uint8(szm1);

ys=cha-96;
ysw=cha-95;

tou=index_zhi(ys);
wei=index_zhi(ysw);

for i=tou:wei
    if input==ecdict(i,1).word
        output=1;
        
        break
    else
        output=0;
        
    end
    
    
    
end




toc
end

