function [cuo1,cuo2,cuo3,cuo4] = cuwufanhui(c)
%CUWUFANHUI �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%outputArg1 = inputArg1;
%outputArg2 = inputArg2;
%kqΪ1ʱ���п��ܿ���ģ��ƥ��
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
%һ����󣬻���һ����ĸ����ǰ�ᣩ
cuo1=strings(changdu,1);
for i=2:1+changdu
    %a_zhong(i-1)= strrep(a,a(i),'!')
    %a_zhong(i-1)= strrep(a,'!','!')
    a=strcat('^',c,'$');
    a(i)='.';
    cuo1(i-1)=a;
end

a=strcat('^',c,'$');
%������󣬼���һ����ĸ����ǰ�ᣩ

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
%�������ȥ��һ����ĸͬʱ����һ����ĸ�����⣬ǰ���������ȴ��ڵ���5���͵�һ�����ظ���

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

%�������2����ĸ���滻�����⣬ǰ���������ȴ��ڵ���5���͵�һ�����ظ���

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

