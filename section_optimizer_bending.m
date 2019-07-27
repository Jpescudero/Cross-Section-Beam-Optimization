function [u,fval,exitflag,output,lambda,grad,hessian] = section_optimizer_bending(F,L,H,W,a,x,y,delta_x,delta_y,rho,sigmat)


%% Variables to be optimized
% u0 = [b1,b2,...,bi];
u0  = 20.*ones(length(y),1);

%% Restrictions

% unequality linear restrictions (Ax < b)
% u0 = [b1,b2,...,bi];
A = [];
b = [];

% Linear Equalities (Aeq x = b) 
% u0 = [b1,b2,...,bi];
Aeq = [];
beq = [];

% Upper and Lower Bounds
% u0 = [b1,b2,...,bi];

% b>0 or b = W if the section is the initial or final one;
if x==0 || x == L
    lb = W * ones(length(y),1);
else
    lb = 2 * ones(length(y),1);
end

%b<W;
ub = W * ones(length(y),1);


%% Start with the default options
options = optimoptions('fmincon');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'MaxFunEvals', 1000000);
options = optimoptions(options,'Algorithm', 'sqp');
[u,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(@(u0)section_bending(u0,F,L,a,x,y,delta_x,delta_y,rho,sigmat),u0,A,b,Aeq,beq,lb,ub,[],options);


