tic
a =[];
b = [];
for m=1:1:2

    PSOMain;
    %Glo = [Global.BestPosition; Global.BestCost]
    a = [a; Global.BestPosition];
    b = [b; Global.BestCost];
    %ab = [a(:),b(:)];
    T = table([a,b]);
    
%    C = table([bbb])
    %writetable(T,'tabledata.txt','delimiter',',','-append');
    %writetable(C,'cos.txt');
%     type pos.txt
%     type cos.txt
    
end
%%

xlswrite('tabledata.xlsx',[a,b],1,'A1')
writetable(T,'tabledata.txt','delimiter',',');
type tabledata.txt
toc

%[num,txt,raw] = xlsread('myfile') ;
A = xlsread('tabledata.xlsx',1,'A1:A2')
