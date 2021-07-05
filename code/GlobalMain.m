close all
clear all
clc
tic
a = [];
b = [];

for m=1:1:1

    PSOMain;
    %Glo = [Global.BestPosition; Global.BestCost]
    a = [a; Global.BestPosition];
    b = [b; Global.BestCost];
    %ab = [a(:),b(:)];
    %T = table([a,b]);
    
%    C = table([bbb])
    %writetable(T,'tabledata.txt','delimiter',',','-append');
    %writetable(C,'cos.txt');
%     type pos.txt
%     type cos.txt
    
end
%%
recycle on % Send to recycle bin instead of permanently deleting.
delete('BestPositions.xlsx'); % Delete (send to recycle bin).
delete('BestCost.xlsx');
xlswrite('BestPositions.xlsx',[a],1,'A1')
xlswrite('BestCost.xlsx',[b],1,'A1')

%writetable(T,'tabledata.txt','delimiter',',');
%type tabledata.txt


%[num,txt,raw] = xlsread('myfile') ;
A = xlsread('BestPositions.xlsx',1,'A1:B15');
B = xlsread('BestCost.xlsx',1,'A1:B15');

test_ga2;
toc