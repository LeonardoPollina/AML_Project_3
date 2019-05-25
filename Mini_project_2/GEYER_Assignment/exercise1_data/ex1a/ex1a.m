load('data1.mat')
load('data2.mat')
load('data3.mat')

ff1_left = data1.footfall.data(:,1);
ff1_right = data1.footfall.data(:,2);
ff2_left = data2.footfall.data(:,1);
ff2_right = data2.footfall.data(:,2);
ff3_left = data3.footfall.data(:,1);
ff3_right = data3.footfall.data(:,2);

%% data set 1
[left_FS1, left_FS1i] = findpeaks(ff1_left);
[left_FO1, left_FO1i] = findpeaks(-ff1_left);
plot(data1.footfall.data(:,1),'color','r')
hold on
plot(data1.footfall.data(:,2),'color','k')
scatter(left_FS1i, left_FS1, '*')
scatter(left_FO1i, -left_FO1,'o')
ylim([-0.1 1.1])
%legend('left','right')

%gait cycle is foot strike to foot strike
gaitcycle_left1 = diff(left_FS1i);
swing_left1 = left_FS1i(2:end)-left_FO1i(1:end-1);
stance_left1 = left_FO1i - left_FS1i;

%right foot
[right_FS1, right_FS1i] = findpeaks(ff1_right);
[right_FO1, right_FO1i] = findpeaks(-ff1_right);
scatter(right_FS1i, right_FS1, '*')
scatter(right_FO1i, -right_FO1,'o')
gaitcycle_right1 = diff(right_FS1i);
stance_right1 = right_FO1i(2:end)-right_FS1i(1:end-1);
swing_right1 = right_FS1i - right_FO1i;

%double support

doublesupport11 = abs(left_FO1i - right_FS1i);
doublesupport12 = abs(right_FO1i - left_FS1i);
doublesupport1 = doublesupport11+doublesupport12;

%value1 = gait cycle duration/stance duration
if (length(gaitcycle_left1)<length(stance_left1))
    value11_left= gaitcycle_left1./stance_left1(2:end);
elseif (length(gaitcycle_left1)>length(stance_left1))
    value11_left= gaitcycle_left1(2:end)./stance_left1;
else
    value11_left= gaitcycle_left1./stance_left1;
end

if (length(gaitcycle_right1)<length(stance_right1))
    value11_right= gaitcycle_right1./stance_right1(2:end);
elseif (length(gaitcycle_right1)>length(stance_right1))
    value11_right= gaitcycle_right1(2:end)./stance_right1;
else
    value11_right= gaitcycle_right1./stance_right1;
end

%value2 = stance duration/swing duration
if (length(stance_left1)<length(swing_left1))
    value12_left= stance_left1./swing_left1(2:end);
elseif (length(stance_left1)>length(swing_left1))
    value12_left= stance_left1(2:end)./swing_left1;
else
    value12_left= stance_left1./swing_left1;
end

if (length(stance_right1)<length(swing_right1))
    value12_right= stance_right1./swing_right1(2:end);
elseif (length(stance_right1)>length(swing_right1))
    value12_right= stance_right1(2:end)./swing_right1;
else
    value12_right= stance_right1./swing_right1;
end

%value3 = swing/double support
if (length(swing_left1)<length(doublesupport1))
    value13_left= swing_left1./doublesupport1(2:end);
elseif (length(swing_left1)>length(doublesupport1))
    value13_left= swing_left1(2:end)./doublesupport1;
else
    value13_left= swing_left1./doublesupport1;
end

if (length(swing_right1)<length(doublesupport1))
    value13_right= swing_right1./doublesupport1(2:end);
elseif (length(swing_right1)>length(doublesupport1))
    value13_right= swing_right1(2:end)./doublesupport1;
else
    value13_right= swing_right1./doublesupport1;
end

%% data set 2

[left_FS2, left_FS2i] = findpeaks(ff2_left);
[left_FO2, left_FO2i] = findpeaks(-ff2_left);
plot(data2.footfall.data(:,1),'color','r')
hold on
plot(data2.footfall.data(:,2),'color','k')

ylim([-0.1 1.1])
%legend('left','right')
scatter(left_FS2i, left_FS2, '*');
scatter(left_FO2i, -left_FO2,'o');
%gait cycle is foot strike to foot strike
gaitcycle_left2 = diff(left_FS2i);
swing_left2 = left_FS2i-left_FO2i;
stance_left2 = left_FO2i(2:end) - left_FS2i(1:end-1);

%right foot
[right_FS2, right_FS2i] = findpeaks(ff2_right)
[right_FO2, right_FO2i] = findpeaks(-ff2_right)
scatter(right_FS2i, right_FS2, '*')
scatter(right_FO2i, -right_FO2,'o')
gaitcycle_right2 = diff(right_FS2i)
stance_right2 = right_FO2i(2:end)-right_FS2i(1:end)
swing_right2 = right_FS2i - right_FO2i(1:end-1)

%double support

doublesupport21 = abs(left_FO2i - right_FS2i)
doublesupport22 = abs(right_FO2i(2:end) - left_FS2i)
doublesupport2 = doublesupport21+doublesupport22

%value1 = gait cycle duration/stance duration
if (length(gaitcycle_left2)<length(stance_left2))
    value21_left= gaitcycle_left2./stance_left2(2:end);
elseif (length(gaitcycle_left2)>length(stance_left2))
    value21_left= gaitcycle_left2(2:end)./stance_left2;
else
    value21_left= gaitcycle_left2./stance_left2;
end

if (length(gaitcycle_right2)<length(stance_right2))
    value21_right= gaitcycle_right2./stance_right2(2:end);
elseif (length(gaitcycle_right2)>length(stance_right2))
    value21_right = gaitcycle_right2(2:end)./stance_right2;
else
    value21_right= gaitcycle_right2./stance_right2;
end

%value2 = stance duration/swing duration
if (length(stance_left2)<length(swing_left2))
    value22_left= stance_left2./swing_left2(2:end);
elseif (length(stance_left2)>length(swing_left2))
    value22_left= stance_left2(2:end)./swing_left2;
else
    value22_left= stance_left2./swing_left2;
end

if (length(stance_right2)<length(swing_right2))
    value22_right= stance_right2./swing_right2(2:end);
elseif (length(stance_right2)>length(swing_right2))
    value22_right= stance_right2(2:end)./swing_right2;
else
    value22_right= stance_right2./swing_right2;
end

%value3 = swing/double support
if (length(swing_left2)<length(doublesupport2))
    value23_left= swing_left2./doublesupport2(2:end);
elseif (length(swing_left2)>length(doublesupport2))
    value23_left= swing_left2(2:end)./doublesupport2;
else
    value23_left= swing_left2./doublesupport2;
end

if (length(swing_right2)<length(doublesupport2))
    value23_right= swing_right2./doublesupport2(2:end);
elseif (length(swing_right2)>length(doublesupport2))
    value23_right= swing_right2(2:end)./doublesupport2;
else
    value23_right= swing_right2./doublesupport2;
end

%% data set 3

[left_FS3, left_FS3i] = findpeaks(ff3_left);
[left_FO3, left_FO3i] = findpeaks(-ff3_left);
plot(data3.footfall.data(:,1),'color','r')
hold on
plot(data3.footfall.data(:,2),'color','k')

ylim([-0.1 1.1])
%legend('left','right')
scatter(left_FS3i, left_FS3, '*');
scatter(left_FO3i, -left_FO3,'o');
%gait cycle is foot strike to foot strike
gaitcycle_left3 = diff(left_FS3i);
swing_left3 = left_FS3i(2:end)-left_FO3i;
stance_left3 = left_FO3i - left_FS3i(1:end-1);

%right foot
[right_FS3, right_FS3i] = findpeaks(ff3_right);
[right_FO3, right_FO3i] = findpeaks(-ff3_right);
scatter(right_FS3i, right_FS3, '*')
scatter(right_FO3i, -right_FO3,'o')
gaitcycle_right3 = diff(right_FS3i);
stance_right3 = right_FO3i(2:end)-right_FS3i(1:end);
swing_right3 = right_FS3i - right_FO3i(1:end-1);

%double support

doublesupport31 = abs(left_FS3i - right_FO3i);
doublesupport32 = abs(right_FS3i - left_FO3i);
doublesupport3 = doublesupport31(1:end-1)+doublesupport32;

%value1 = gait cycle duration/stance duration
if (length(gaitcycle_left3)<length(stance_left3))
    value31_left= gaitcycle_left3./stance_left3(2:end);
elseif (length(gaitcycle_left3)>length(stance_left3))
    value31_left= gaitcycle_left3(2:end)./stance_left3;
else
    value31_left= gaitcycle_left3./stance_left3;
end

if (length(gaitcycle_right3)<length(stance_right3))
    value31_right= gaitcycle_right3./stance_right3(2:end);
elseif (length(gaitcycle_right3)>length(stance_right3))
    value31_right = gaitcycle_right3(2:end)./stance_right3;
else
    value31_right= gaitcycle_right3./stance_right3;
end

%value2 = stance duration/swing duration
if (length(stance_left3)<length(swing_left3))
    value32_left= stance_left3./swing_left3(2:end);
elseif (length(stance_left3)>length(swing_left3))
    value32_left= stance_left3(2:end)./swing_left3;
else
    value32_left= stance_left3./swing_left3;
end

if (length(stance_right3)<length(swing_right3))
    value32_right= stance_right3./swing_right3(2:end);
elseif (length(stance_right3)>length(swing_right3))
    value32_right= stance_right3(2:end)./swing_right3;
else
    value32_right= stance_right3./swing_right3;
end

%value3 = swing/double support
if (length(swing_left3)<length(doublesupport3))
    value33_left= swing_left3./doublesupport3(2:end);
elseif (length(swing_left3)>length(doublesupport3))
    value33_left= swing_left3(2:end)./doublesupport3;
else
    value33_left= swing_left3./doublesupport3;
end

if (length(swing_right3)<length(doublesupport3))
    value33_right= swing_right3./doublesupport3(2:end);
elseif (length(swing_right3)>length(doublesupport3))
    value33_right= swing_right3(2:end)./doublesupport3;
else
    value33_right= swing_right3./doublesupport3;
end

%%

value1 = [value11_left; value11_right; value21_left; value21_right; value31_left; value31_right];
value2 = [value12_left; value12_right; value22_left; value22_right; value32_left; value32_right];
value3 = [value13_left; value13_right; value23_left; value23_right; value33_left; value33_right];

value1_mean = mean(value1);
value1_std = std(value1);
value2_mean = mean(value2);
value2_std = std(value2);
value3_mean = mean(value3);
value3_std = std(value3);

xvals = [1 2 3];
a = yline(1.618, '--r','LineWidth',1.2,'DisplayName','Golden Ratio');
hold on
legend(a,'\phi','AutoUpdate','off');
errorbar(xvals,[value1_mean value2_mean value3_mean],[value1_std value2_std value3_std], 'o')
hold on
ax = gca;
ax.FontSize = 20;
%plot(xvals, [value1_mean value2_mean value3_mean], 'o')
xlim([0 4])
ylim([0 2])
xtick = [1; 2; 3];
xtl1 = '$\frac{gaitcycle}{stance}$';
xtl2 = '$\frac{stance}{swing}$';
xtl3 = '$\frac{swing}{double support}$';
xticks([1 2 3])
set(gca,'XTickLabel', {xtl1 xtl2 xtl3}, 'TickLabelInterpreter', 'latex');
%xticklabels({'gaitcycle/\n stance','2','3'})
yticks([0 0.5 1.0 1.5 2.0])
yticklabels({'0','0.5','1.0','1.5','2.0'})

%%
gaitcycle1 = [gaitcycle_left1; gaitcycle_right1];
gaitcycle1 = mean(gaitcycle1./100)
cadence1 = (1/gaitcycle1)
speed1 = power(cadence1/0.85,2)

gaitcycle2 = [gaitcycle_left2; gaitcycle_right2];
gaitcycle2 = mean(gaitcycle2./100)
cadence2 = (1/gaitcycle2)
speed2 = power(cadence2/0.85,2)

gaitcycle3 = [gaitcycle_left3; gaitcycle_right3];
gaitcycle3 = mean(gaitcycle3./100)
cadence3 = (1/gaitcycle3)
speed3 = power(cadence3/0.85,2)






