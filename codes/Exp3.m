
%% Inputs: 
% envrn: Matrix of size Horizon x NbrArms
% gam: exploration rate (value taken - 0.05)
%% Outputs:
% gEXP3: vector of observations for each time step

function gEXP3 = Exp3(envrn, gam)
[Horizon, NbrArms] = size(envrn);
if nargin == 1;
    gam = 0.05; % Exploration Rate
end

%%INITIALIZATION
[w, gEXP3] = EXP3_Init(NbrArms); % Initialize the vector weight w

%%INTERACTION (Includes arm recommendation and award received according to the estimator function and probability)
for t = 1:Horizon;
    [ArmToPlay, p] = EXP3_RecArm(w, gam);
    reward = rand() < envrn(t,ArmToPlay);
    [w, gEXP3] = EXP3_RR(w, p, reward, NbrArms, gam, ArmToPlay, gEXP3);
end


            

                 
                 
                 
                 
                 
                 
                 
                 