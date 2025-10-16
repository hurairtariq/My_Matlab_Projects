% Difference Equation vs Analytical Equation Comparision of ydot(t) = 2*y(t)
% Written by Hurair Tariq
% Sampling time Ts = 0.05(most error), 0.02 0.01 0.001(least error) As we have lesser value of
% samping time Ts the more closely graph obtained from discrete time
% matches the analytical solution. 
% Continuous time plot . Solved by Analytical Method
% ydot(t) = 2*y(t)--> y=Aexp(s*t) --> s=2--> --> y=Aexp(2*t) --> I.C. y(0) = 5 --> A=5 
% solution is  y=5*exp(2*t)
% t1 and y1 are theoretically calculated values
clc; clear all;
t1=0:0.1:2;
y1=5*exp(2*t1); 
plot(t1,y1)
grid on 
hold on
% DIfference Equation
% I.C. y(0) = 5 --> t=k*Ts where Ts= Sampling time k = 0,1,2 ... --> ydot(t) = 2*y(t)
% [y(k+1)-y(k)] / Ts = 2*y(k) --> y(k+1) = 2*y(k)*Ts + y(k)

finalTime = 2; % 2 seconds
Ts=0.001;     % Ts = Sampling time 
secondlastIndex= finalTime/Ts; 
y=zeros(1,secondlastIndex+1);
y(1)=5; % in MATLAB y(0) does not have any meaning so we were forced to start from y(1)
t=ones(1,secondlastIndex); % Initialize memory allocation to speed up the code
for k=1:secondlastIndex+1
    t(k)=(k-1)*Ts;
    if k < secondlastIndex+1
        y(k+1)=2*Ts*y(k)+y(k);
    end
end

plot(t,y)
grid on
axis([0,1,0,40])
