%Exp3P: reward using the estimator function
function [w, gEXP3P] = EXP3P_RR(w, p,reward, K, Horizon, gam, ArmC, gEXP3P)
    if((reward <0) + (reward >1) ~= 0)
        error('Reward must be between 0 and 1');
    end
    alpha = 1/Horizon;
    gEXP3P = [gEXP3P reward];
    reward = reward/p(ArmC);
    w = w.*exp(gam/(3*K).*(reward + alpha./(p.*(sqrt(K*Horizon)))));
    w = w/sum(w);   
end