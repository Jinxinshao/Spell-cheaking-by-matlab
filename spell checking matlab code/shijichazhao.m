function [jieguo1,jieguo2] = shijichazhao(wordip,kmh,ecdict)
%SHIJICHAZHAO �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%outputArg1 = inputArg1;
%outputArg2 = inputArg2;
%1��ģ����0����
%�ж��Ƿ��д�
tic
wordip=convertStringsToChars(wordip);
flag=0;
tf = strcmpi(wordip,ecdict.word);

x=find(tf==1);
%ecdict(x,1).word

if isempty(x)==0
    disp('���ҵ��ô���޴���');
    disp('�ڴʿ��е�λ��Ϊ');
    fprintf('%d  %s  %n',x,ecdict(x,1).word);
    fprintf(' %n');
    
    jieguo1=[];
    jieguo2=[];
else
    flag=1;
    
end

if flag==1
    
    
    
    [a,b,c,d]=cuwufanhui(wordip);
    
    di1lei=[a;b];
    di2lei=[c;d];
    zonghe=[a;b;c;d];
    [shuchu1,shuchu2] = chachong(di1lei,di2lei);
    
    tq1=size(shuchu1);
    t1=tq1(1);
    
    jieguo1=[];
    %���1tf = strcmpi('wod',ecdict.word);
    
    x=find(tf==1);
    for i=1:t1
        expression =convertStringsToChars(shuchu1(i,1));
        match = regexpi(ecdict.word,expression,'match');
        match(cellfun(@isempty,match))=[];
        jieguo1=cat(1,jieguo1,match);
    end
    
    disp('�����һ����ܴ���');
    jieguo1
    fprintf(' %n');
    
    changdu=length(wordip);
    
    kqflag=0;
    
    if changdu>4
        kqflag=1;
    else
        kqflag=0;
    end
    
    if isempty(jieguo1)==1
        kqflag=1;
        kmh=1;
        disp('��һ�����δ�ҵ��⣬ǿ�п����ڶ������ģ������');
    end
    
    
    
    
    if (kqflag==1)&(kmh==1)
        
        
        
        tq2=size(shuchu2);
        t2=tq2(1);
        
        jieguo2=[];
        %���1
        for j=1:t2
            expression =convertStringsToChars(shuchu2(j,1));
            match = regexpi(ecdict.word,expression,'match');
            match(cellfun(@isempty,match))=[];
            jieguo2=cat(1,jieguo2,match);
            
            
           
            
            
        end
         disp('����ڶ�����ܴ���ģ����');
            jieguo2
            fprintf(' %n');
    else
        disp('δ����ģ�����ң����ܹرջ����ַ�����5��');
        jieguo2=[];
    end
    
else
    
    
    
end


toc
end

