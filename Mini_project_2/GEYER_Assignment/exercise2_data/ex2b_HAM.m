

%% 
load('Struct_simulation.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;
plot(LStance)
[~,left_FS] = findpeaks(LStance,'MinPeakDistance',50);
[~,right_FS] = findpeaks(RStance,'MinPeakDistance',50);
[~,left_FO] = findpeaks(-LStance,'MinPeakDistance',50);
[~,right_FO] = findpeaks(-RStance,'MinPeakDistance',50);

% calculate step frequency

gaitcycle_left = diff(left_FS); gaitcycle_right = diff(right_FS);
gaitcycle = [gaitcycle_left; gaitcycle_right];
gaitcycle =mean(gaitcycle./1000)
cadence = (1/gaitcycle)
speed = power(cadence/0.85,2)
steplength =gaitcycle*speed/2

%% 
load('symHAMSensorNoise0.03.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);

leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+70)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+70)==1)
        rightFS = [rightFS right_FS(i)];
    end
end

plot(RStance)
hold on
scatter(rightFS,RStance(rightFS))
% calculate step frequency

gaitcycle_left = diff(leftFS); 
gaitcycle_right = diff(rightFS);
gaitcycle = [gaitcycle_left gaitcycle_right];
gaitcycle =mean(gaitcycle./1000)
cadence = (1/gaitcycle)
speed = power(cadence/0.85,2)
steplength =gaitcycle*speed/2

%% 
load('symHAMSensorNoise0.015.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);

leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+70)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+15)==1 &&RStance(right_FS(i)+45)==1&&RStance(right_FS(i)+60)==1)
        rightFS = [rightFS right_FS(i)];
    end
end

% plot(RStance)
% hold on
% scatter(rightFS,RStance(rightFS))

plot(LStance)
hold on
scatter(leftFS,LStance(leftFS))
% calculate step frequency

gaitcycle_left = diff(leftFS); 
gaitcycle_right = diff(rightFS);
gaitcycle = [gaitcycle_left gaitcycle_right];
gaitcycle =mean(gaitcycle./1000)
cadence = (1/gaitcycle)
speed = power(cadence/0.85,2)
steplength =gaitcycle*speed/2

%%
load('asymHAMSensorNoise0.02.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);

leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+25)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+70)==1)
        rightFS = [rightFS right_FS(i)];
    end
end

plot(LStance)
hold on
scatter(leftFS,LStance(leftFS))
% calculate step frequency

gaitcycle_left = diff(leftFS); 
gaitcycle_right = diff(rightFS);
gaitcycle = [gaitcycle_left gaitcycle_right];
gaitcycle =mean(gaitcycle./1000)
cadence = (1/gaitcycle)
speed = power(cadence/0.85,2)
steplength =gaitcycle*speed/2
%% 
load('asymHAMSensorNoise0.01.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);

leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+70)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+15)==1 &&RStance(right_FS(i)+45)==1&&RStance(right_FS(i)+60)==1)
        rightFS = [rightFS right_FS(i)];
    end
end

plot(RStance)
hold on
scatter(rightFS,RStance(rightFS))

% plot(LStance)
% hold on
% scatter(leftFS,LStance(leftFS))
% calculate step frequency

gaitcycle_left = diff(leftFS); 
gaitcycle_right = diff(rightFS);
gaitcycle = [gaitcycle_left gaitcycle_right];
gaitcycle =mean(gaitcycle./1000)
cadence = (1/gaitcycle)
speed = power(cadence/0.85,2)
steplength =gaitcycle*speed/2
%%
load('symHAMStimNoise0.02.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);

leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+70)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+70)==1)
        rightFS = [rightFS right_FS(i)];
    end
end

% plot(RStance)
% hold on
% scatter(rightFS,RStance(rightFS))

plot(LStance)
hold on
scatter(leftFS,LStance(leftFS))
% calculate step frequency

gaitcycle_left = diff(leftFS); 
gaitcycle_right = diff(rightFS);
gaitcycle = [gaitcycle_left gaitcycle_right];
gaitcycle =mean(gaitcycle./1000)
cadence = (1/gaitcycle)
speed = power(cadence/0.85,2)
steplength =gaitcycle*speed/2
%%
load('symHAMStimNoise0.01.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);

leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+70)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+70)==1)
        rightFS = [rightFS right_FS(i)];
    end
end

plot(RStance)
hold on
scatter(rightFS,RStance(rightFS))

% plot(LStance)
% hold on
% scatter(leftFS,LStance(leftFS))
% calculate step frequency

gaitcycle_left = diff(leftFS); 
gaitcycle_right = diff(rightFS);
gaitcycle = [gaitcycle_left gaitcycle_right];
gaitcycle =mean(gaitcycle./1000)
cadence = (1/gaitcycle)
speed = power(cadence/0.85,2)
steplength =gaitcycle*speed/2

%%
load('asymHAMStimNoise0.018.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);

leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+70)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+70)==1)
        rightFS = [rightFS right_FS(i)];
    end
end

% plot(RStance)
% hold on
% scatter(rightFS,RStance(rightFS))

plot(LStance)
hold on
scatter(leftFS,LStance(leftFS))
% calculate step frequency

gaitcycle_left = diff(leftFS); 
gaitcycle_right = diff(rightFS);
gaitcycle = [gaitcycle_left gaitcycle_right];
gaitcycle =mean(gaitcycle./1000)
cadence = (1/gaitcycle)
speed = power(cadence/0.85,2)
steplength =gaitcycle*speed/2
%%
load('asymHAMStimNoise0.009.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);

leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+70)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+70)==1)
        rightFS = [rightFS right_FS(i)];
    end
end

% plot(RStance)
% hold on
% scatter(rightFS,RStance(rightFS))

plot(LStance)
hold on
scatter(leftFS,LStance(leftFS))
% calculate step frequency

gaitcycle_left = diff(leftFS); 
gaitcycle_right = diff(rightFS);
gaitcycle = [gaitcycle_left gaitcycle_right];
gaitcycle =mean(gaitcycle./1000)
cadence = (1/gaitcycle)
speed = power(cadence/0.85,2)
steplength =gaitcycle*speed/2