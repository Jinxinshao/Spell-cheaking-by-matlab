function [shuchu1,shuchu2] = chachong(duru1,duru2)
%CHACHONG �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%shuchu1 = duru1;
%shuchu2 = duru2;

a= length(duru1);
b= length(duru2);
c=[];
for i=1:a
    for j=1:b
        if duru1(i)==duru2(j)
            %b=b-1;
            c(end+1,:)=j;
        end
        
        
        
        
    end
    
    
    
end
            duru2(c)=[];
           % b= length(duru2);




shuchu1=duru1;
shuchu2=duru2;


end

