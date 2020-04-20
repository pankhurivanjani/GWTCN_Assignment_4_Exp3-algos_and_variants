%%Bernoulli Distribution Function for Exp3_1X Algorithm
function [result] = generate_Bernoulli(p,m)
temp = rand(1,m);
result = p > temp;
end
