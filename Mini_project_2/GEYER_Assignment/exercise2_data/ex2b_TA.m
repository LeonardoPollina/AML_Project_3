

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
load('symTASensorNoise0.019.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);
a = left_FS<12750;
left_FS = left_FS(a);
b = right_FS<12750;
right_FS = right_FS(b);
leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+58)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+50)==1&& RStance(right_FS(i)+20)==1)
        rightFS = [rightFS right_FS(i)];
    end
end

% plot(RStance)
% hold on
% scatter(rightFS,RStance(rightFS))
% 
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
load('symTASensorNoise0.010.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);
a = left_FS<12750;
left_FS = left_FS(a);
b = right_FS<12750;
right_FS = right_FS(b);
leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+70)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+25)==1 &&RStance(right_FS(i)+45)==1&&RStance(right_FS(i)+60)==1)
        rightFS = [rightFS right_FS(i)];
    end
end

plot(RStance)
hold on
scatter(rightFS,RStance(rightFS))
% 
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
load('asymTASensorNoise0.04.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);
a = left_FS<12750;
left_FS = left_FS(a);
b = right_FS<12750;
right_FS = right_FS(b);
leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+75)==1&& LStance(left_FS(i)+50)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+70)==1&& RStance(right_FS(i)+30)==1)
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
load('asymTASensorNoise0.02.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);
a = left_FS<12750;
left_FS = left_FS(a);
b = right_FS<12750;
right_FS = right_FS(b);

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
load('symTAStimNoise0.15.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);

a = left_FS<12750;
left_FS = left_FS(a);
b = right_FS<12750;
right_FS = right_FS(b);

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
load('symTAStimNoise0.3.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);

a = left_FS<12750;
left_FS = left_FS(a);
b = right_FS<12750;
right_FS = right_FS(b);

leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+70)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+35)==1 && RStance(right_FS(i)+25)==1)
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
load('asymTAStimNoise0.58.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);
a = left_FS<12750;
left_FS = left_FS(a);
b = right_FS<12750;
right_FS = right_FS(b);
leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+70)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+50)==1 && RStance(right_FS(i)+20)==1)
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
load('asymTAStimNoise0.29.mat');
LStance = mRFX.LStance;
RStance = mRFX.RStance;

[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);
a = left_FS<12750;
left_FS = left_FS(a);
b = right_FS<12750;
right_FS = right_FS(b);
leftFS = []
for i = 1:length(left_FS)
    if (LStance(left_FS(i)+250)==1 && LStance(left_FS(i)+70)==1)
        leftFS = [leftFS left_FS(i)];
    end
end
rightFS = []
for i = 1:length(right_FS)
    if (RStance(right_FS(i)+250)==1 && RStance(right_FS(i)+70)==1&& RStance(right_FS(i)+20)==1)
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