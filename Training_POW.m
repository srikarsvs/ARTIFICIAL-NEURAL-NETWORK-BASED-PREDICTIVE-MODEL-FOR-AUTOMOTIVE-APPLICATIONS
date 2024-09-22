clc
clear all
close all
warning off
%% Read Data from excel 
[num txt raw] = xlsread('.\Data.xlsx',3);

Lim = floor(size(num,1)*0.8);

Input = num(1:Lim,1:2);
OUT = num(1:Lim,3);

%% Training ANN - trainscg
net = newff(Input',OUT',10,{'tansig'},'trainscg');
net = train(net,Input',OUT');
save(['POW_netscg.mat'],'net')

%% Training ANN - trainbfg
net = newff(Input',OUT',10,{'tansig'},'trainbfg');
net = train(net,Input',OUT');
save(['POW_netbfg.mat'],'net')


%% Training ANN - trainrp
net = newff(Input',OUT',10,{'tansig'},'trainrp');
net = train(net,Input',OUT');
save(['POW_netrp.mat'],'net')




