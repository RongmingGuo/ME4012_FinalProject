%%
qall = [sin(0 : 0.01 : 10); zeros(1, 1001)];
for i = 1 : 1001
    plotCart(qall(:, i), cart);
    pause(0.01);
    clf;
end