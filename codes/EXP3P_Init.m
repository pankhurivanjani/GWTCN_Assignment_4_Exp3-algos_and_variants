%Initialization of probability function
function [w, gEXP3P] = EXP3P_Init(K, gam, Horizon)
    alpha = 1/Horizon;
     w = ones(1,K)*exp(alpha*gam/3*sqrt(Horizon/K));
    gEXP3P = [];
end