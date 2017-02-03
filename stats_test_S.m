% script for assessing significance of border-line
% small-world cases

clear all
warning('off');
load current_data_set
sig = 0.01;     % 99% interval
ns = 1000;

%%% for Sws....
FLAG = 1;

% %% not small-worlds?
% % net#10
% [alpha_not(1),sb_not{1}] = SbootstrapER(n(10),k(10),sig,ns,FLAG);
% % net#32
% [alpha_not(2),sb_not{2}] = SbootstrapER(n(32),k(32),sig,ns,FLAG);
% % net#36
% [alpha_not(3),sb_not{3}] = SbootstrapER(n(36),k(36),sig,ns,FLAG);

% border-line cases = nets#1, 11, 20, 34
[alpha_ws(1),sb_ws{1}] = SbootstrapER(n(1),k(1),sig,ns,FLAG); disp(1)
[alpha_ws(2),sb_ws{2}] = SbootstrapER(n(11),k(11),sig,ns,FLAG); disp(2)
[alpha_ws(3),sb_ws{3}] = SbootstrapER(n(20),k(20),sig,ns,FLAG); disp(3)
[alpha_ws(4),sb_ws{4}] = SbootstrapER(n(34),k(34),sig,ns,FLAG); disp(4)

%%% for Stri
FLAG = 2;

% border-line cases = nets#1, 10, 20, 21, 32, 33, 34
[alpha_tri(1),sb_tri{1}] = SbootstrapER(n(1),k(1),sig,ns,FLAG); disp(5)
% skip this one cos it never ends...
%[alpha_tri(2),sb_tri{2}] = SbootstrapER(n(10),k(10),sig,ns,FLAG); disp(6)
[alpha_tri(3),sb_tri{3}] = SbootstrapER(n(20),k(20),sig,ns,FLAG); disp(7)
[alpha_tri(4),sb_tri{4}] = SbootstrapER(n(21),k(21),sig,ns,FLAG); disp(8)
[alpha_tri(5),sb_tri{5}] = SbootstrapER(n(32),k(32),sig,ns,FLAG); disp(9)
[alpha_tri(6),sb_tri{6}] = SbootstrapER(n(33),k(33),sig,ns,FLAG); disp(10)
[alpha_tri(7),sb_tri{7}] = SbootstrapER(n(34),k(34),sig,ns,FLAG); disp(11)

save data_S_stats alpha_ws sb_ws alpha_tri sb_tri
