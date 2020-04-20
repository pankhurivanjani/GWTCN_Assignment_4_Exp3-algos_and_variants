function [ArmToPlay, p] = EXP3_RecArm(w, gam)
    K = length(w);
    p = (1-gam)*w/sum(w) + gam/K;
    Prob = cumsum(p);
    ArmToPlay = Prob > rand();
    ArmToPlay = find(ArmToPlay == 1,1,'first');
end