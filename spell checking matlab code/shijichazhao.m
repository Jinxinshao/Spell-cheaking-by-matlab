function [jieguo1,jieguo2] = shijichazhao(wordip,kmh,ecdict)
%SHIJICHAZHAO 此处显示有关此函数的摘要
%   此处显示详细说明
%outputArg1 = inputArg1;
%outputArg2 = inputArg2;
%1开模糊，0不开
%判定是否有错
tic
wordip=convertStringsToChars(wordip);
flag=0;
tf = strcmpi(wordip,ecdict.word);

x=find(tf==1);
%ecdict(x,1).word

if isempty(x)==0
    disp('查找到该词语，无错误');
    disp('在词库中的位置为');
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
    %输出1tf = strcmpi('wod',ecdict.word);
    
    x=find(tf==1);
    for i=1:t1
        expression =convertStringsToChars(shuchu1(i,1));
        match = regexpi(ecdict.word,expression,'match');
        match(cellfun(@isempty,match))=[];
        jieguo1=cat(1,jieguo1,match);
    end
    
    disp('输出第一类可能错误');
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
        disp('第一类错误未找到解，强行开启第二类错误模糊查找');
    end
    
    
    
    
    if (kqflag==1)&(kmh==1)
        
        
        
        tq2=size(shuchu2);
        t2=tq2(1);
        
        jieguo2=[];
        %输出1
        for j=1:t2
            expression =convertStringsToChars(shuchu2(j,1));
            match = regexpi(ecdict.word,expression,'match');
            match(cellfun(@isempty,match))=[];
            jieguo2=cat(1,jieguo2,match);
            
            
           
            
            
        end
         disp('输出第二类可能错误（模糊）');
            jieguo2
            fprintf(' %n');
    else
        disp('未开启模糊查找（功能关闭或者字符不足5）');
        jieguo2=[];
    end
    
else
    
    
    
end


toc
end

