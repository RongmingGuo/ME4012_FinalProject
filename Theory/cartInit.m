% This file stores all the parameters of the cart in a struct
cart = struct();
%% Geometry
cart.a = 0.1; % m, half-chassis length
cart.b = 0.015; % m, extension of wheel from chassis
cart.R = 0.045; % m, radius of the wheel
cart.H = 0.07; % m, chassis ground clerance
cart.h = 0.2; % m, pole height
cart.L = 0.15; % m, pendulum arm length
%% Dynamics
cart.mw = 0.289; % kg, mass of the wheel
cart.Iw = 3.9826e-04; % kg*m^2, rotational inertia of the wheel
cart.M = 2.5; % kg, entire cart mass, excluding the pendulum
cart.mp = 1; % kg, mass of the pendulum
cart.Ip = 0.0225; % kg*m^2, rotational inertia of the pendulum with respect to the mount point.
