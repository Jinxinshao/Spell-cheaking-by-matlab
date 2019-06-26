%chuangdu=length(match);
%c = strrep(sunzibingfa, ' ', '');
c = strings;
%char(c);


c(:)=match{:};


%cLen = length(c);
%raw1d(find(cellfun(@(sunzibingfa)any(isnan(sunzibingfa)),raw1d)))=mat2cell('useless'); 
%替换cell中的NaN变成useless
tongji_guwen=tabulate(c(:,1));
tongji_guwen=sortrows(tongji_guwen,-3); 
%jieguo=HistRate(c(:));
size_wenzi=size(tongji_guwen);
a=size_wenzi(1);
%b=size_wenzi(2);
H=0;
for i=1:a
    p=(cell2mat(tongji_guwen(i,3)))/100;
    h_fen=p*log2(1/p);
    H=H+h_fen;
    
    
end

H