function [cuo1,cuo2,cuo3,cuo4] = cuwufanhui(c)
%CUWUFANHUI 此处显示有关此函数的摘要
%   此处显示详细说明
%outputArg1 = inputArg1;
%outputArg2 = inputArg2;
%kq为1时才有可能开启模糊匹配
%tic
%c='call';
expression = '^c.ll$';
changdu=length(c);
%
% flag=0;
%
% if changdu>4
%     flag=1;
% else
%     flag=0;
% end


a=strcat('^',c,'$');
%一类错误，换掉一个字母（无前提）
cuo1=strings(changdu,1);
for i=2:1+changdu
    %a_zhong(i-1)= strrep(a,a(i),'!')
    %a_zhong(i-1)= strrep(a,'!','!')
    a=strcat('^',c,'$');
    a(i)='.';
    cuo1(i-1)=a;
end

a=strcat('^',c,'$');
%二类错误，加上一个字母（无前提）

cuo2=strings(changdu,1);


for i=1:1+changdu
    %a_zhong(i-1)= strrep(a,a(i),'!')
    %a_zhong(i-1)= strrep(a,'!','!')
    a=strcat('^',c,'$');
    %a(i)=strcat(a(i),'.');
    a(i+2:end+1)=a(i+1:end);
    a(i+1)='.';
    cuo2(i)=a;
end

a=strcat('^',c,'$');

%if  flag==1
%三类错误，去掉一个字母同时加上一个字母（任意，前提条件长度大于等于5，和第一类有重复）

cuo3=strings(changdu*changdu,1);
zhong3=strings(changdu,1);
for i=2:1+changdu
    %a_zhong(i-1)= strrep(a,a(i),'!')
    %a_zhong(i-1)= strrep(a,'!','!')
    a=strcat('^',c,'$');
    a(i)=[];
    zhong3(i-1)=a;
    
end
for k=1:changdu
    %     chuli=strings(1,1);
    %     chuli=zhong3(k,1);
    
    for j=1:changdu
        chuli=strings(1,1);
        chuli=zhong3(k,1);
        chuli=convertStringsToChars(chuli);
        chuli(j+2:end+1)=chuli(j+1:end);
        chuli(j+1)='.';
        num=(k-1)*changdu+j;
        cuo3(num)=chuli;
    end
    
end
a=strcat('^',c,'$');

%四类错误，2个字母的替换（任意，前提条件长度大于等于5，和第一类有重复）

cuo4=strings(changdu-1,1);
for i=2:changdu
    %a_zhong(i-1)= strrep(a,a(i),'!')
    %a_zhong(i-1)= strrep(a,'!','!')
    a=strcat('^',c,'$');
    a(i:i+1)='..';
    cuo4(i-1)=a;
end

a=strcat('^',c,'$');




%toc

%end

end

