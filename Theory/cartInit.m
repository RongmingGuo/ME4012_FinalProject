% This file stores all the parameters of the cart in a struct
cart = struct();
%% Geometry
cart.a = 0.1; % m, half-chassis length
cart.b = 0.015; % m, extension of wheel from chassis
cart.R = 0.045; % m, radius of the wheel
cart.H = 0.07; % m, chassis ground clerance
cart.h = 0.2; % m, pole height
cart.L = 0.15; % m, half pendulum arm length
%% Dynamics
cart.mw = 0.1; % kg, mass of the wheel
cart.Iw = 2/3 * cart.mw * cart.R^2; % kg*m^2, rotational inertia of the wheel
cart.M = 0.5; % kg, entire cart mass, excluding the pendulum
cart.mp = 0.2; % kg, mass of the pendulum
cart.Icc_p = 1/3 * cart.mp * (cart.L)^2; % kg*m^2, rotational inertia of the physical pendulum with respect to its center of mass
