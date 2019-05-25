
load('Struct_simulation.mat');

LStance = mRFX.LStance;
RStance = mRFX.RStance;
[~,left_FS] = findpeaks(LStance);
[~,right_FS] = findpeaks(RStance);
[~,left_FO] = findpeaks(-LStance);
[~,right_FO] = findpeaks(-RStance);

% To compute the general stance percentage in a gait cycle
right_percentage = mean((right_FO-right_FS(1:end-1))./diff(right_FS));
left_percentage = mean((left_FO(3:end)-left_FS(2:end))./diff(left_FS));
final_percentage_stance = mean([right_percentage left_percentage])*100;

max_gait_cycle_length_left = max(diff(left_FS));
max_gait_cycle_length_right = max(diff(right_FS));

nbr_points_to_interpolate = 1000;
%% For muscles

labels_muscle = {'GLU','HF','HAM','VAS','GAS','SOL','TA'};

for muscle = 1:length(labels_muscle)
    for cycle = 1:length(left_FS)-1
        current_muscle_left = mRFX.(['LMuscle' labels_muscle{muscle}]);
        gait_to_store_left = current_muscle_left(left_FS(cycle):left_FS(cycle+1))';
        gait_interpolated_left = interp1(1:length(gait_to_store_left), gait_to_store_left, linspace(1, length(gait_to_store_left), nbr_points_to_interpolate), 'nearest');
        gait_cycles.(['LMuscle' labels_muscle{muscle}]).divided(cycle,:) = gait_interpolated_left;
        
        current_muscle_right = mRFX.(['RMuscle' labels_muscle{muscle}]);
        gait_to_store_right = current_muscle_right(right_FS(cycle):right_FS(cycle+1))';
        gait_interpolated_right = interp1(1:length(gait_to_store_right), gait_to_store_right, linspace(1, length(gait_to_store_right), nbr_points_to_interpolate), 'nearest');
        gait_cycles.(['RMuscle' labels_muscle{muscle}]).divided(cycle,:) = gait_interpolated_right;
    end
end

for muscle = 1:length(labels_muscle)
    % We multiply by 100 just to have a real percentage of muscle activity
    gait_cycles.(['LMuscle' labels_muscle{muscle}]).mean_activity = mean(100*gait_cycles.(['LMuscle' labels_muscle{muscle}]).divided);
    gait_cycles.(['LMuscle' labels_muscle{muscle}]).std_activity = std(100*gait_cycles.(['LMuscle' labels_muscle{muscle}]).divided);
    
    gait_cycles.(['RMuscle' labels_muscle{muscle}]).mean_activity = mean(100*gait_cycles.(['RMuscle' labels_muscle{muscle}]).divided);
    gait_cycles.(['RMuscle' labels_muscle{muscle}]).std_activity = std(100*gait_cycles.(['RMuscle' labels_muscle{muscle}]).divided);
    
    % To plot
    figure();
    vec_idx_left = 1:1:nbr_points_to_interpolate;
    vec_idx_right = 1:1:nbr_points_to_interpolate;
    
    normalized_vec_left = (vec_idx_left./nbr_points_to_interpolate)*100;
    normalized_vec_right = (vec_idx_right./nbr_points_to_interpolate)*100;
    
    plot(normalized_vec_left,gait_cycles.(['LMuscle' labels_muscle{muscle}]).mean_activity,'r','LineWidth',1.2);
    hold on;
    fill_x = [normalized_vec_left, fliplr(normalized_vec_left)];
    fill_y = [gait_cycles.(['LMuscle' labels_muscle{muscle}]).mean_activity - gait_cycles.(['LMuscle' labels_muscle{muscle}]).std_activity, fliplr(gait_cycles.(['LMuscle' labels_muscle{muscle}]).mean_activity + gait_cycles.(['LMuscle' labels_muscle{muscle}]).std_activity)];
    patch(fill_x,fill_y,'r','EdgeColor','none');
    alpha(.2)
    
    plot(normalized_vec_right,gait_cycles.(['RMuscle' labels_muscle{muscle}]).mean_activity,'b','LineWidth',1.2);
    fill_x = [normalized_vec_right, fliplr(normalized_vec_right)];
    fill_y = [gait_cycles.(['RMuscle' labels_muscle{muscle}]).mean_activity - gait_cycles.(['RMuscle' labels_muscle{muscle}]).std_activity, fliplr(gait_cycles.(['RMuscle' labels_muscle{muscle}]).mean_activity + gait_cycles.(['RMuscle' labels_muscle{muscle}]).std_activity)];
    patch(fill_x,fill_y,'b','EdgeColor','none');
    alpha(.2)
    
    legend({'Left mean','Std left','Right mean','Std right'},'Interpreter','latex','AutoUpdate','off');
    ax = gca;
    ax.FontSize = 24;
    
    XMIN = 0;
    XMAX = 100;
    YMIN = -inf;
    YMAX = inf;
    axis([XMIN XMAX YMIN YMAX]);
    title(labels_muscle{muscle});
    xline(final_percentage_stance,'k--','LineWidth',2);
    yline(0,'k--','LineWidth',2);
    set(0,'defaultTextInterpreter','latex'); 
    xlabel('\% Gait cycle');
    ylabel('\% Muscle Activity');
    set(gcf, 'Position', [1 1 980 300]);
    saveas(gcf,['Figures/Muscle_' labels_muscle{muscle}],'png');
end
%% For torques 
labels_torque = {'Ankle','Hip','Knee'};

for torque = 1:length(labels_torque)
    for cycle = 1:length(left_FS)-1
        current_torque_left = mRFX.(['L' labels_torque{torque} 'Torque']);        
        gait_to_store_left = current_torque_left(left_FS(cycle):left_FS(cycle+1))';
        gait_interpolated_left = interp1(1:length(gait_to_store_left), gait_to_store_left, linspace(1, length(gait_to_store_left), nbr_points_to_interpolate), 'nearest');
        gait_cycles.(['L' labels_torque{torque} 'Torque']).divided(cycle,:) = gait_interpolated_left;
        
        
        current_torque_right = mRFX.(['R' labels_torque{torque} 'Torque']);
        gait_to_store_right = current_torque_right(right_FS(cycle):right_FS(cycle+1))';
        gait_interpolated_right = interp1(1:length(gait_to_store_right), gait_to_store_right, linspace(1, length(gait_to_store_right), nbr_points_to_interpolate), 'nearest');
        gait_cycles.(['R' labels_torque{torque} 'Torque']).divided(cycle,:) = gait_interpolated_right;
   end
end

for torque = 1:length(labels_torque)
    gait_cycles.(['L' labels_torque{torque} 'Torque']).mean_activity = mean(-(gait_cycles.(['L' labels_torque{torque} 'Torque']).divided));
    gait_cycles.(['L' labels_torque{torque} 'Torque']).std_activity = std(-(gait_cycles.(['L' labels_torque{torque} 'Torque']).divided));
    
    gait_cycles.(['R' labels_torque{torque} 'Torque']).mean_activity = mean(-(gait_cycles.(['R' labels_torque{torque} 'Torque']).divided));
    gait_cycles.(['R' labels_torque{torque} 'Torque']).std_activity = std(-(gait_cycles.(['R' labels_torque{torque} 'Torque']).divided));
    % To plot
    figure();
    vec_idx_left = 1:1:nbr_points_to_interpolate;
    vec_idx_right = 1:1:nbr_points_to_interpolate;
    
    normalized_vec_left = (vec_idx_left./nbr_points_to_interpolate)*100;
    normalized_vec_right = (vec_idx_right./nbr_points_to_interpolate)*100;
    
    
    plot(normalized_vec_left,gait_cycles.(['L' labels_torque{torque} 'Torque']).mean_activity,'r','LineWidth',1.2);
    hold on;
    fill_x = [normalized_vec_left, fliplr(normalized_vec_left)];
    fill_y = [gait_cycles.(['L' labels_torque{torque} 'Torque']).mean_activity - gait_cycles.(['L' labels_torque{torque} 'Torque']).std_activity, fliplr(gait_cycles.(['L' labels_torque{torque} 'Torque']).mean_activity + gait_cycles.(['L' labels_torque{torque} 'Torque']).std_activity)];
    patch(fill_x,fill_y,'r','EdgeColor','none');
    alpha(.2)
    
    plot(normalized_vec_right,gait_cycles.(['R' labels_torque{torque} 'Torque']).mean_activity,'b','LineWidth',1.2);
    fill_x = [normalized_vec_right, fliplr(normalized_vec_right)];
    fill_y = [gait_cycles.(['R' labels_torque{torque} 'Torque']).mean_activity - gait_cycles.(['R' labels_torque{torque} 'Torque']).std_activity, fliplr(gait_cycles.(['R' labels_torque{torque} 'Torque']).mean_activity + gait_cycles.(['R' labels_torque{torque} 'Torque']).std_activity)];
    patch(fill_x,fill_y,'b','EdgeColor','none');
    alpha(.2)
    
    legend({'Left mean','Std left','Right mean','Std right'},'Interpreter','latex','AutoUpdate','off');
    ax = gca;
    ax.FontSize = 24;
    
    XMIN = 0;
    XMAX = 100;
    YMIN = -inf;
    YMAX = inf;
    axis([XMIN XMAX YMIN YMAX]);
    title(labels_torque{torque});
    xline(final_percentage_stance,'k--','LineWidth',2);
    yline(0,'k--','LineWidth',2);
    set(0,'defaultTextInterpreter','latex'); 
    xlabel('\% Gait cycle');
    ylabel('Torque [N$\cdot$m]');
    set(gcf, 'Position', [1 1 980 300]);
    saveas(gcf,['Figures/Torque_' labels_torque{torque}],'png');
end
%% For Angles

labels_angle = {'Ankle','Hip','Knee'};

for angle = 1:length(labels_angle)
    for cycle = 1:length(left_FS)-1
        current_angle_left = mRFX.(['L' labels_angle{angle} 'Angle']);
        gait_to_store_left = current_angle_left(left_FS(cycle):left_FS(cycle+1))';
        gait_interpolated_left = interp1(1:length(gait_to_store_left), gait_to_store_left, linspace(1, length(gait_to_store_left), nbr_points_to_interpolate), 'nearest');
        gait_cycles.(['L' labels_angle{angle} 'Angle']).divided(cycle,:) = gait_interpolated_left;
        
        current_angle_right = mRFX.(['R' labels_angle{angle} 'Angle']);
        gait_to_store_right = current_angle_right(right_FS(cycle):right_FS(cycle+1))';
        gait_interpolated_right = interp1(1:length(gait_to_store_right), gait_to_store_right, linspace(1, length(gait_to_store_right), nbr_points_to_interpolate), 'nearest');
        gait_cycles.(['R' labels_angle{angle} 'Angle']).divided(cycle,:) = gait_interpolated_right;
    end
end

for angle = 1:length(labels_angle)
    % rad2deg is applied and we take out 180 deg. (for ankle 90 deg)
    if strcmp(labels_angle{angle},'Ankle')
        gait_cycles.(['L' labels_angle{angle} 'Angle']).mean_activity = mean(-(rad2deg(gait_cycles.(['L' labels_angle{angle} 'Angle']).divided)-90));
        gait_cycles.(['L' labels_angle{angle} 'Angle']).std_activity = std(-(rad2deg(gait_cycles.(['L' labels_angle{angle} 'Angle']).divided)-90));
        
        gait_cycles.(['R' labels_angle{angle} 'Angle']).mean_activity = mean(-(rad2deg(gait_cycles.(['R' labels_angle{angle} 'Angle']).divided)-90));
        gait_cycles.(['R' labels_angle{angle} 'Angle']).std_activity = std(-(rad2deg(gait_cycles.(['R' labels_angle{angle} 'Angle']).divided)-90));
    else
        gait_cycles.(['L' labels_angle{angle} 'Angle']).mean_activity = mean(-(rad2deg(gait_cycles.(['L' labels_angle{angle} 'Angle']).divided)-180));
        gait_cycles.(['L' labels_angle{angle} 'Angle']).std_activity = std(-(rad2deg(gait_cycles.(['L' labels_angle{angle} 'Angle']).divided)-180));
        
        gait_cycles.(['R' labels_angle{angle} 'Angle']).mean_activity = mean(-(rad2deg(gait_cycles.(['R' labels_angle{angle} 'Angle']).divided)-180));
        gait_cycles.(['R' labels_angle{angle} 'Angle']).std_activity = std(-(rad2deg(gait_cycles.(['R' labels_angle{angle} 'Angle']).divided)-180));
    end
    % To plot
    figure();
    vec_idx_left = 1:1:nbr_points_to_interpolate;
    vec_idx_right = 1:1:nbr_points_to_interpolate;
    
    normalized_vec_left = (vec_idx_left./nbr_points_to_interpolate)*100;
    normalized_vec_right = (vec_idx_right./nbr_points_to_interpolate)*100;
    
    plot(normalized_vec_left,gait_cycles.(['L' labels_angle{angle} 'Angle']).mean_activity,'r','LineWidth',1.2);
    hold on;
    fill_x = [normalized_vec_left, fliplr(normalized_vec_left)];
    fill_y = [gait_cycles.(['L' labels_angle{angle} 'Angle']).mean_activity - gait_cycles.(['L' labels_angle{angle} 'Angle']).std_activity, fliplr(gait_cycles.(['L' labels_angle{angle} 'Angle']).mean_activity + gait_cycles.(['L' labels_angle{angle} 'Angle']).std_activity)];
    patch(fill_x,fill_y,'r','EdgeColor','none');
    alpha(.2)
    
    plot(normalized_vec_right,gait_cycles.(['R' labels_angle{angle} 'Angle']).mean_activity,'b','LineWidth',1.2);
    fill_x = [normalized_vec_right, fliplr(normalized_vec_right)];
    fill_y = [gait_cycles.(['R' labels_angle{angle} 'Angle']).mean_activity - gait_cycles.(['R' labels_angle{angle} 'Angle']).std_activity, fliplr(gait_cycles.(['R' labels_angle{angle} 'Angle']).mean_activity + gait_cycles.(['R' labels_angle{angle} 'Angle']).std_activity)];
    patch(fill_x,fill_y,'b','EdgeColor','none');
    alpha(.2)
    
    legend({'Left mean','Std left','Right mean','Std right'},'Interpreter','latex','AutoUpdate','off');
    ax = gca;
    ax.FontSize = 24;
    
    XMIN = 0;
    XMAX = 100;
    YMIN = -inf;
    YMAX = inf;
    axis([XMIN XMAX YMIN YMAX]);
    title(labels_angle{angle});
    xline(final_percentage_stance,'k--','LineWidth',2);
    yline(0,'k--','LineWidth',2);
    set(0,'defaultTextInterpreter','latex'); 
    xlabel('\% Gait cycle');
    ylabel('Angle [deg]');
    set(gcf, 'Position', [1 1 980 300]);
    saveas(gcf,['Figures/Angle' labels_angle{angle}],'png');
end

clc;
