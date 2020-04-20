function envir = make_envir(BMM, Horizon)
    [no_of_periods, K] = size(BMM);
    T = Horizon/no_of_periods; % Time Period
    envir = zeros(Horizon,K);
    
    for k = 1:K;
        vect = [];
        for period = 1:no_of_periods
            vect = [vect BMM(period,k)*ones(1,T)];
        end
        envir(:,k) = vect';
    end
end