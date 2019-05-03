function [] = plot_empirical_rule()

% Our points found by the empirical rule of the J-shape (fixing the initial
% horizontal velocity to V0 = 6 m/s
empirical_data(1,:) = [70,13.23];
empirical_data(2,:) = [62,7.35];
empirical_data(3,:) = [55,3.82];
empirical_data(4,:) = [50,2.94];
empirical_data(5,:) = [45,2.65];


f1 = figure(1);
plot(empirical_data(:,1),empirical_data(:,2),'bo-','LineWidth',1.2);
ax = gca;
ax.FontSize = 25;
xlabel('Angle of attack [deg]');
ylabel('Spring constant k [kN/m]');
title('Empirical Rule (V_0 = 6 m/s)');

set(f1,'Position',[0 0 800 980]);
saveas(f1,'Empirical_rule.png');

end