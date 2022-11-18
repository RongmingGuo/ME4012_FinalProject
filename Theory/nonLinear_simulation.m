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
X = [0; 0.5; 0; 0];
% [phi;
% theta;
% phi_dot;
% theta_dot];

%% Simulation Starts
tStep = 0.01; % Simulation Step Time = 0.01s. Use 1st order solver
tEnd = 10; % Simulation Total Time = 10s
Result = [];
% t
% tw(t)
% phi(t)
% theta(t)
for t = 0 : tStep : tEnd
   t
   % Apply feed forward torque
   tw = 0.3 * (X(2)) + 0.1 * (X(4)); % PD
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

%% Simulate Results
qall = Result(3:4, :);
[~, n] = size(qall);
for i = 1 : n
    plotCart(qall(:, i), cart);
    pause(tStep);
    clf;
end