function [] = plotCart(q, cart)
    % q: configuration vector of the cart
    % cart: MATLAB object consisting the parameters of the cart
    phi = q(1);
    theta = q(2);
    x = phi * cart.R;
    % Plot ground
    ground = plot([-10, 10], [0, 0], 'k', 'LineWidth', 2);
    grid on
    hold on
    axis equal
    xlim([x - 1, x + 1]);
    ylim([-0.1, 0.9]);
    % Plot Wheels
    wheels = plot([x - cart.a - cart.b, x + cart.a + cart.b], [cart.R, cart.R], 'k.', 'MarkerSize', 40);
    wheelLine1 = plot([x - cart.a - cart.b, x - cart.a - cart.b + cart.R * cos(-phi)], [cart.R, cart.R + cart.R * sin(-phi)], 'w', 'LineWidth', 0.5);
    wheelLine2 = plot([x + cart.a + cart.b, x + cart.a + cart.b + cart.R * cos(-phi)], [cart.R, cart.R + cart.R * sin(-phi)], 'w', 'LineWidth', 0.5);
    % Plot cart chassis
    chassis = plot([x - cart.a, x + cart.a], [cart.H, cart.H], 'K', 'LineWidth', 3);
    % Plot pole
    pole = plot([x, x], [cart.H, cart.H + cart.h], 'k', 'LineWidth', 8);
    % Plot pendulum
    xp = x + 2 * cart.L * sin(theta);
    yp = cart.H + cart.h + 2 * cart.L * cos(theta);
    arm = plot([x, xp], [cart.H + cart.h, yp], 'r', 'LineWidth', 1);
    bob = plot(xp, yp, 'r.', 'MarkerSize', 20);
end