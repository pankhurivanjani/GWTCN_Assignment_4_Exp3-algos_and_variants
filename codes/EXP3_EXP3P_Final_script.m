%%For analyzing results of Exp3 and Exp3P this final script has to be run

%%Define the envrn
BMM = [0.9 0.1 0.1;0.2 0.5 0.9; 0.1 0.9 0.2]; % Bernoulli Means Matrix
Horizon = 900; %Number of interaction with the envrn
envrn= make_envir(BMM, Horizon); 
batSi = 300;

%Launching the adversarial bandits
gEXP3  = Exp3(envrn);
gEXP3P = Exp3P(envrn);

%%PLOTTING THE RESULTS
PlotRes(gEXP3, 'EXP3 with gamma= 0.05 and bernouille distribution')   
PlotRes(gEXP3P, 'EXP3P with gamma= 0.05 and bernouille distribution') 