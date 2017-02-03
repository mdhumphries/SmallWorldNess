%% script to compute small-world-ness and do statistical testing on example data network
% Mark Humphries 3/2/2017

clear all; close all;

% load the adjacency matrix for the Lusseau bottle-nose dolphin social
% network
load dolphins  % loads struct of data in "Problem"; adjacency matrix is Problem.A

FLAG_Cws = 1;
FLAG_Ctransitive = 2;

% get its basic properties
n = size(Problem.A,1);  % number of nodes
k = sum(Problem.A);  % degree distribution of undirected network
K = mean(k); % mean degree of network

%% computing small-world-ness using the analytical approximations for the E-R graph

[expectedC,expectedL] = ER_Expected_L_C(K,n);  % L_rand and C_rand

[S_ws,C_ws,L] = small_world_ness(Problem.A,expectedL,expectedC,FLAG_Cws);  % Using WS clustering coefficient
[S_trans,C_trans,L] = small_world_ness(Problem.A,expectedL,expectedC,FLAG_Ctransitive);  %  Using transitive clustering coefficient



%% computing small-world-ness by estimating L_rand and C_rand from an ensemble of random graphs

% Note: if using a different random graph null model, e.g. the
% configuration model, then use this form
