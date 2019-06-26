
% input="word";
% 
% ab= size(test);
% a=ab(1);
% 
% output=0;
% 
% for i=1:a
%     if test(i,1).word==input
%         output=1;
%         break
%         
%     else
%         output=0;
%         
%     end
%     
%     
%     
% end

%ÖÆ×÷Ë÷Òý
%extractBefore(str,6)

 ab= size(ecdict);
 a=ab(1); 

parfor i=1:a
     index(i,1)=extractBefore(ecdict(i,1).word,2);




end
