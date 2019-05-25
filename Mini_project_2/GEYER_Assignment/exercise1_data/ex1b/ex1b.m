load('data1.mat')
load('data2.mat')

ff1_left = data1.footfall.data(:,1);
ff1_right = data1.footfall.data(:,2);
ff2_left = data2.footfall.data(:,1);
ff2_right = data2.footfall.data(:,2);
figure(1)
[left_FS1, left_FS1i] = findpeaks(ff1_left)
[left_FO1, left_FO1i] = findpeaks(-ff1_left)
plot(data1.footfall.data(:,1),'color','r')
hold on
plot(data1.footfall.data(:,2),'color','k')
scatter(left_FS1i, left_FS1, '*')
scatter(left_FO1i, -left_FO1,'o')

ylim([-0.1 1.1])
[right_FS1, right_FS1i] = findpeaks(ff1_right)
[right_FO1, right_FO1i] = findpeaks(-ff1_right)
scatter(right_FS1i, right_FS1, '*')
scatter(right_FO1i, -right_FO1,'o')
hold off

figure(2)
[left_FS2, left_FS2i] = findpeaks(ff2_left)
[left_FO2, left_FO2i] = findpeaks(-ff2_left)
plot(data2.footfall.data(:,1),'color','r')
hold on
plot(data2.footfall.data(:,2),'color','k')
scatter(left_FS2i, left_FS2, '*')
scatter(left_FO2i, -left_FO2,'o')

ylim([-0.1 1.1])
[right_FS2, right_FS2i] = findpeaks(ff2_right)
[right_FO2, right_FO2i] = findpeaks(-ff2_right)
scatter(right_FS2i, right_FS2, '*')
scatter(right_FO2i, -right_FO2,'o')

%%
figure()
plot(data1.grf.data(:,2))
figure()
plot(data2.grf.data(:,2), 'k')
hold on
plot(data2.footfall.data(:,1).*3000,'r')
plot(data2.footfall.data(:,2).*3000,'b')



