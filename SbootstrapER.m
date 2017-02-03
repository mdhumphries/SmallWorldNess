function [alpha,Sb] = SbootstrapER(n,k,sig,ns,FLAG)

% SBOOTSTRAPER bootstrap small-world-ness values for E-R random graph
% [A,V] = SBOOTSTRAPER(N,K,SIG,SAMP,FLAG) computes the value A of the small-world-ness 
%   statistic (S) that is at the confidence interval SIG for a graph of 
%   size N and mean degree K. This is acheived by bootstrapping SAMP random graphs.
%   SIG should be given as proportion i.e. SIG = 0.05 is the symmetric 95% confidence
%   interval; if a one-tailed interval is required, then halve SIG.
%
%   The value of FLAG determines which clustering coefficient is computed:
%       1 - raw S: clustering coefficient of Watts & Strogatz (1998)
%       2 - raw S: transitivity clustering coefficient (no. of triangles) e.g.
%           Barat & Weigt(2000); Newman et al (2001); 
%       3 - magnitude S: clustering coefficient of Watts & Strogatz (1998)
%       4 - magnitdue S: transitivity clustering coefficient (no. of triangles) e.g.
%           Barat & Weigt(2000); Newman et al (2001);  
%   Will also return the sorted list V of generated small-world-ness
%   values.
%
%   Notes:
%   (1) The S-score computed here is based on comparison with the E-R random graph, following the
%       Watts & Strogatz (1998) definition.
%   (2) The expected C and L values for an E-R random graph are computed, implying:
%       (i) Small n would lead to errors, as path length is underestimated 
%       (ii) This procedure is currently only defined for undirected graphs, what is
%       expected C and L for a directed E-R graph?
%   (3) The returned confidence interval score is the bootstrap estimate of the mass SIG of the
%       probability distribution falling between its central value and
%       +/- A (see Efron, 1979, pp.465-467).
%       
%   References:
%   Efron, B. (1979) Computers and the theory of statistics: thinking the
%   unthinkable. SIAM Review, 21, 460-480.
%
%   Mark Humphries 3/2/2017

[expectedC,expectedL] = ER_Expected_L_C(k,n);

m = round(k*n);    % the number of unique edges

S = zeros(ns,1);

for i = 1:ns
    A = random_graph(n,0,m,'undirected');
    [S(i),other] = small_world_ness(A,expectedC,expectedL,FLAG);
end

Sb = sort(S);
ix = floor(sig/2 * ns);    % index in from each end corresponding to alpha number...
alpha = (Sb(ns-ix) - Sb(ix)) / 2;





