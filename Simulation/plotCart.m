function [] = plotCart(q, cart)
    % q: configuration vector of the cart
    % cart: MATLAB object consisting the parameters of the cart
    x = q(1);
    phi = q(2);
    theta = q(3);
    % Plot ground
    ground = plot([-1, 1], [0, 0], 'k', 'LineWidth', 2);
    grid on
    hold on
    xlim([-1, 1]);
    ylim([-0.1, 0.9]);
    % Plot Wheels
    wheels = plot([x - cart.a - 0.02, x + cart.a + 0.02], [cart.R, cart.R], 'k.', 'MarkerSize', 30);
    % Plot cart chassis
    chassis = plot([x - cart.a, x + cart.a], [cart.H, cart.H], 'K', 'LineWidth', 3);
    % Plot pole
    pole = plot([x, x], [cart.H, cart.H + cart.h], 'k', 'LineWidth', 8);
    % Plot pendulum
    xp = x - cart.L * sin(theta);
    yp = cart.H + cart.h + cart.L * cos(theta);
    arm = plot([x, xp], [cart.H + cart.h, yp], 'r', 'LineWidth', 1);
    bob = plot(xp, yp, 'r.', 'MarkerSize', 20);
end