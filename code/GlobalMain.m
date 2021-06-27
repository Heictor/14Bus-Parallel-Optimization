tic
a = [];
b = [];

for m=1:1:14

    PSOMain;
    %Glo = [Global.BestPosition; Global.BestCost]
    a(m) = [a(m); Global.BestPosition(:)];
    %b = [b; Global.BestCost(:)];
    %ab = [a(:),b(:)];
    %T = table([a,b]);
    
%    C = table([bbb])
    %writetable(T,'tabledata.txt','delimiter',',','-append');
    %writetable(C,'cos.txt');
%     type pos.txt
%     type cos.txt
    
end
%%

xlswrite('tabledata.xlsx',[a],1,'A1')

%writetable(T,'tabledata.txt','delimiter',',');
%type tabledata.txt


%[num,txt,raw] = xlsread('myfile') ;
A = xlsread('tabledata.xlsx',1,'A1:B14')


test_ga2;
toc