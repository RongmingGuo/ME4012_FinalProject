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
Ip = cart.Ip;
%% Environment Constants
g = 9.81; % m/s^2, gravitational acceleration
%% Initial conditions
X = [0; 0; 0; 0];
% [phi;
% theta;
% phi_dot;
% theta_dot];

%% Simulation Starts
tStep = 0.01; % Simulation Step Time = 0.01s. Use 1st order solver
tEnd = 1; % Simulation Total Time = 20s
Result = [];
% t
% tauw(t)
% phi(t)
% theta(t)
for t = 0 : tStep : tEnd
   t
   % Apply feed forward torque
   tauw = 10; % constant 2NM
   % Solving Differential Equations
   A = zeros(2);
   b = zeros(2, 1);
   A(1, 1) = Iw + 1/4 * M * R^2 + 1/4 * R^2 * mp;
   A(1, 2) = 1/4 * R * mp * L * cos(X(2));
   b(1) = tauw + (R/4) * mp * L * sin(X(2) * X(4)^2); % EOM1
   A(2, 1) = -L * R * mp * cos(X(2));
   A(2, 2) = Ip - L^2 * mp * cos(X(2)^2);
   b(2) = L * g * mp * sin(X(2)) + L * mp * sin(X(2)) * (L * X(4)^2 * cos(X(2)) - g + L * X(4)^2 * sin(X(2))) - L^2 * X(4)^2 * mp * cos(X(2)) * sin(X(2));
   A
   secondOrder = A\b;
   dX = [X(3); X(4); secondOrder];
   % Do the update
   X = X + dX * tStep;
   % Record value
   Result = [Result, [t; tauw; X(1); X(2)]];
end