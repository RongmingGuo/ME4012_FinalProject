% This file stores all the parameters of the cart in a struct
cart = struct();
%% Geometry (Primarily for Plotting in Simulation)
cart.a = 0.1; % m, half-chassis length
cart.b = 0.005; % m, extension of wheel from chassis
cart.R = 0.03; % m, radius of the wheel
cart.H = 0.054; % m, chassis ground clerance
cart.h = 0.04; % m, pole height
cart.L = 0.15; % m, half pendulum arm length
%% Mass & Inertia
cart.mw = 0.02839; % kg, mass of the wheel, obtained from Solidworks
cart.Iw = 13966.17 * 10^-9; % kg*m^2, rotational inertia of the wheel, obtained from Solidworks
cart.M = 0.5; % kg, entire cart mass, excluding the pendulum
cart.mp = 0.18378; % kg, mass of the pendulum
cart.Icc_p = 1/12 * cart.mp * (2 * cart.L)^2; % kg*m^2, rotational inertia of the physical pendulum with respect to its center of mass
