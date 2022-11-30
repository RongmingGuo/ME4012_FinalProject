% This file stores all the parameters of the cart in a struct
cart = struct();
%% Geometry (Primarily for Plotting in Simulation)
cart.a = 0.1; % m, half-chassis length
cart.b = 0.005; % m, extension of wheel from chassis
cart.R = 0.06; % m, radius of the wheel
cart.H = cart.R + 0.024; % m, chassis ground clerance
cart.h = 0.04; % m, pole height
cart.L = 0.15; % m, half pendulum arm length
%% Mass & Inertia
cart.mw = 0.043; % kg, mass of the wheel, obtained from Solidworks
cart.Iw = 77400.31 * 10^-9; % kg*m^2, rotational inertia of the wheel, obtained from Solidworks
cart.M = 1.0358; % kg, entire cart mass, excluding the pendulum
cart.mp = 0.18378; % kg, mass of the pendulum
cart.Icc_p = 1/12 * cart.mp * (2 * cart.L)^2; % kg*m^2, rotational inertia of the physical pendulum with respect to its center of mass
