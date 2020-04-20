%% Implementation of EXP3.IX
clc; 
clear;
n=10;
l=5;
x=nchoosek(n,l);
Time=1e4;
delta=0.01;% (assumtion taken according to rules).
z=sqrt(2*log(x)/(x*Time));
gam=z/2;

u=0;
eta_vec=z*10.^u;
mult=10.^u;
rep=1e2;

%%defining zero matix for loss function
eta_loss_mat1_exp3ix=zeros(rep,size(u,2));
eta_loss_mat_exp3ix=zeros(rep,size(u,2));
ta_loss_matrix=zeros(rep,Time);
ta_gain_matrix=zeros(rep,Time);

time_vec=1:Time;
comb_matrix=zeros(x,n);
y=nchoosek(1:n,l);
for i=1:x
   vector=zeros(1,n);
   vector(y(i,:))=1;
   comb_matrix(i,:)=vector;
end
total_loss=0;
total_gain=0;
%Defining zero array for estimator
estimates=zeros(1,x);

%Regret bound function after simplication of original equation
regret_bound=4*sqrt(l*l*l*n*log(n)*ones(1,Time)./time_vec);

for dn=1:size(eta_vec,2)

    for r=1:rep
        total_loss=0;
        w_i=ones(1,x);

        total_loss_vector=zeros(1,Time);

        e=0.09; %epsilon assumption has been taken 
        %Loop over the defined time steps
        for t=1:Time
            %Policy to select the arm according to time steps while taking
            %bernoulli distribution into consideration
            arms=zeros(1,n);
            if(t <=0)
                arms(l+1:end)=1;
            elseif(t <=5*Time/10)
                 arms(1:l)=generate_Bernoulli(0.5+e,l);
                 arms(l+1:end)=generate_Bernoulli(0.5-e,l);
            else
                arms(1:l)=generate_Bernoulli(0.5-e,l);
                 arms(l+1:end)=generate_Bernoulli(0.5+4*e,l);
            end
           %probability for arm selection
           p_i=w_i/sum(w_i);
           probab=cumsum(p_i); %cumulative probability 
           rv=rand(1);
           sel=find(rv<probab, 1 );

           %Calculating gain/reward with the selected arms
           selected_arm_vector=comb_matrix(sel,:);
           g=selected_arm_vector.*arms;
           w_i(sel)=w_i(sel)*exp(-z*(l-sum(g))/(p_i(sel)+gam));
           total_gain=total_gain + sum(g);
           total_gain_vector(t)=total_gain;

           %Calculating total loss with the selected arms
           w_i=w_i/sum(w_i);
           loss=l-sum(g);
           total_loss=total_loss+loss;
           total_loss_vector(t)=total_loss;
        end
        ta_loss_matrix(r,:)=total_loss_vector./time_vec;
        ta_gain_matrix(r,:)=total_gain_vector./time_vec;

    end

    error=zeros(1,Time);
    for t=1:Time
    vector=ta_loss_matrix(:,t);
    vector_gain=ta_gain_matrix(:,t);
    error(t)=(max(vector)-min(vector))/2;
    end
end
%%Plotting of cumulative loss and gain against time steps
sampled_time=1:Time/50:Time;
ta_loss_vector=mean(ta_loss_matrix);
ta_gain_vector=mean(ta_gain_matrix);

figure,
subplot(2,1,1);
plot(time_vec,ta_gain_vector,'k');
title('Exp-3.1X')
xlabel('Time step')
ylabel('Cumulative gain')
subplot(2,1,2);
plot(time_vec,ta_loss_vector,'k');
title('Cumulative loss against time steps, using bernouille distribution')
xlabel('Time step')
ylabel('Cumulative loss')