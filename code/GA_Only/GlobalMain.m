close all
clear all
clc
tic

%% Calling PSO and Exporting Data

%Setting a and b as empty vector/matrix
a = [];
b = [];

%Calling PSO
PSOMain;

a = [a; Global.BestPosition]; %a gets the Global Best Positions found on PSO
b = [b; Global.BestCost]; %b gets the Global Best Costs found on PSO

%ab = [a(:),b(:)];
%T = table([a,b]); 

%% Export data from PSO to GA using table/sheet

recycle on % Send previous sheet to recycle bin instead of permanently deleting.
%Delete previous data
delete('BestPositions.xlsx'); % Delete (send to recycle bin).
delete('BestCost.xlsx');
%Writes new data on sheets
xlswrite('BestPositions.xlsx',[a],1,'A1')
xlswrite('BestCost.xlsx',[b],1,'A1')
%Read new data from sheets
A = xlsread('BestPositions.xlsx',1,'A1:B15');
B = xlsread('BestCost.xlsx',1,'A1:B15');

%% Calling GA function
test_ga2;
toc