%%
clear;
clc;
close all;
%% Loading & Interpreting cart information
cartInit;
a = cart.a;
b = cart.b;
R = cart.R;
H = cart.H;
h = cart.h;
L = cart.L;
mw = cart.mw;
Iw = cart.Iw;
M = cart.M;
mp = cart.mp;
Icc_p = cart.Icc_p;
%% Environment Constants
g = 9.81; % m/s^2, gravitational acceleration
%% Initial conditions
X = [0; 0.2; 0; 0];
% [phi;
% theta;
% phi_dot;
% theta_dot];

%% Simulation Starts
tStep = 0.001; % Simulation Step Time = 0.01s. Use 1st order solver
tEnd = 10; % Simulation Total Time = 0.1s
Result = [];
% t
% tw(t)
% phi(t)
% theta(t)
for t = 0 : tStep : tEnd
   t
   % Apply feed forward torque
   % tw = 1; % unit step
   X_noise = X + 0.2 * (0.5 - rand(4, 1)); % sensor noise
   tw = 0.4143 * (X_noise(4) + 13.37 * X_noise(2)); % PD Controller
   tw = tw + 0.05 * (0.5 - rand());
   % At t = 5 - 5.1, apply external push
   if (t >= 3 && t <= 3.1)
      tw = tw - 1; 
   end
   
   if (t >= 5 && t <= 5.5)
      tw = tw + 1.5; 
   end
   % Solving Differential Equations
   A = zeros(2);
   b = zeros(2, 1);
   A(1, 1) = Iw + (M*R^2)/4 + (R^2*mp)/4;
   A(1, 2) = (L*R*mp*cos(X(2)))/4/4;
   b(1) = (L*R*mp*sin(X(2))*X(4)^2)/4 + tw; % EOM1
   A(2, 1) = L*R*mp*cos(X(2));
   A(2, 2) = mp*L^2*cos(X(2))^2 + mp*L^2*sin(X(2))^2 + Icc_p;
   b(2) = L*sin(X(2))*(- L*mp*cos(X(2))*X(4)^2 + g*mp) + L^2*X(4)^2*mp*cos(X(2))*sin(X(2));
   secondOrder = A\b;
   dX = [X(3); X(4); secondOrder];
   % Do the update
   X = X + dX * tStep;
   % Record value
   Result = [Result, [t; tw; X(1); X(2)]];
end

%% Simulate Results & Make Video
qall = Result(3:4, :);
[~, n] = size(qall);

% Make video
v = VideoWriter('simulatedCart.avi');
open(v);
for i = 1 : 20 : n
    Result(1, i) % print time
    plotCart(qall(:, i), cart);
    % Make video
    frame = getframe(gcf);
    writeVideo(v, frame);
    pause(tStep);
    clf;
end

close(v);

%% Plots
figure(2);
plot(0 : tStep : tEnd, (-1) * Result(4, :)); % plot theta
grid on
hold on
ylim([-1, 3.5]);
legend('theta(t)');
figure(3);
plot(0 : tStep : tEnd, Result(2, :)); % plot input torque
grid on
hold on
ylim([-1, 3.5]);
legend('tau(t)');