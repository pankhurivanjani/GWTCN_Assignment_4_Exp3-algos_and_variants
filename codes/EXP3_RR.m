function [w, gEXP3] = EXP3_RR(w, p,reward, K, gam, ArmC, gEXP3)
    if((reward <0) + (reward >1) ~= 0)
        error('Reward must be between 0 and 1');
    end
    gEXP3 = [gEXP3 reward];
    reward = reward/p(ArmC);
    w(ArmC) = w(ArmC)*exp(gam*reward/K);
    w = w/sum(w);   
end