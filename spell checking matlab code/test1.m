% pattern=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
%     a=770612
%     id=1;
% 
% for i=1:a
%     
%     if contains(index(i,1),pattern(id),'IgnoreCase',true)==1
%         index_zhi(id)=i;
%         id=id+1;
%       
%         if id==27;
%             
%             break
%             
%         end
%     end
%         
% 
% 
% 
% end
%查找有用！
% tf = strcmp('wod',ecdict.word);
% 
% x=find(tf==1);
% 
% ecdict(x,1).word




% expression = '^c.ll$';
%startIndex = regexpi(str,expression)
%expression = '[a]+[d]+[n]';
%si= regexpi(ecdict(:,1).word,expression);
%si(cellfun(@isempty,si))=[]

%x=find(tf==1);

%ecdict(startIndex,1).word
% 
% [match] = regexpi(ecdict(:,1).word,expression,'match');
% match(cellfun(@isempty,match))=[]

%匹配效果：

[a,b,c,d]=cuwufanhui('appla');

di1lei=[a;b];
di2lei=[c;d];
zonghe=[a;b;c;d];
 [shuchu1,shuchu2] = chachong(di1lei,di2lei);

tq1=size(shuchu1);
t1=tq1(1);

jieguo1=[];
 %输出1
 for i=1:t1
expression =convertStringsToChars(shuchu1(i,1));
match = regexpi(ecdict.word,expression,'match');
match(cellfun(@isempty,match))=[];
jieguo1=cat(1,jieguo1,match);
 end
 
tq2=size(shuchu2);
t2=tq2(1);

% jieguo2=[];
%  %输出1
%  for j=1:t2
% expression =convertStringsToChars(shuchu2(i,1));
% match = regexpi(ecdict.word,expression,'match');
% match(cellfun(@isempty,match))=[];
% jieguo2=cat(1,jieguo2,match);
%  end



%cat(1,di1lei,di2lei);












