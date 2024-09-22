clc
clear all
close all
warning off
%% Read Data from excel 
[num txt raw] = xlsread('.\Data.xlsx',1);

Lim = floor(size(num,1)*0.8);

Input = num(1:Lim,1:2);
PA = num(1:Lim,3);

%% Training ANN - trainscg
net = newff(Input',PA',10,{'tansig'},'trainscg');
net = train(net,Input',PA');
save(['PA_netscg.mat'],'net')

%% Training ANN - trainbfg
net = newff(Input',PA',10,{'tansig'},'trainbfg');
net = train(net,Input',PA');
save(['PA_netbfg.mat'],'net')


%% Training ANN - trainrp
net = newff(Input',PA',10,{'tansig'},'trainrp');
net = train(net,Input',PA');
save(['PA_netrp.mat'],'net')




