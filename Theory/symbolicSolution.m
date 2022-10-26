%% Initialize Symbolic Variables
syms mp R L tw Iw M Ip g
syms phi dphi ddphi o do ddo

%% Equations
% eqn1 = mp * (R * ddphi + L * (-sin(o) * (do)^2 + cos(o) * ddo)) == 4 * (tw - Iw * ddphi - M * R^2 / 4 * ddphi) / R;
% eqn2 = Ip * ddo == (L * cos(o)) * 4 * (tw - Iw * ddphi - M * R^2 / 4 * ddphi) / R + mp * g * L * sin(o) - L * sin(o) * mp * (-L * cos(o) * (do)^2 - L * sin(o) * ddo) - mp * g;

eqn1 = (1/4 * M * R^2 + Iw) * ddphi == tw - R/4 * mp * (R * ddphi + L * (-sin(o) * do^2 + cos(o) * ddo));
eqn2 = Ip * ddo == mp * (R * ddphi + L * (-sin(o) * (do)^2 + cos(o) * ddo)) * L * cos(o) - mp * (L * (-cos(o) * do^2 - sin(o) * ddo) + g) * L * sin(o) + mp * g * L * sin(o);
%% Equations to Matrix
[A, b] = equationsToMatrix([eqn1, eqn2], [ddphi, ddo]);
