
%% Inputs: 
% envrn: Matrix of size Horizon x NbrArms
% gam: exploration rate (Default value = 0.05)
%% Outputs:
% gEXP3P: vector of observations for each time step

function gEXP3P = Exp3P(envrn, gam)
[Horizon, NbrArms] = size(envrn);
if nargin == 1;
    gam = 0.05; % Exploration Rate
end


%%INITIALIZATION
[w, gEXP3P] = EXP3P_Init(NbrArms, gam, Horizon);

%%INTERACTION (This interaction results in recommendation for picking up
%%arm with some probability and rewward the agent accordingly

for t = 1:Horizon;
    [ArmToPlay, p] = EXP3_RecArm(w, gam);
    reward = rand() < envrn(t,ArmToPlay);
    [w, gEXP3P] = EXP3P_RR(w, p, reward, NbrArms, Horizon, gam, ArmToPlay, gEXP3P);
end
        

                
                 
                 
                 
                 
                 
                 
                 