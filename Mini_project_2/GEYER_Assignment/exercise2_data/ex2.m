LStance = mRFX.LStance;
RStance = mRFX.RStance;
[~,left_FS] = findpeaks(LStance)
[~,right_FS]=findpeaks(RStance)
[~,left_FO]=findpeaks(-LStance)
[~,right_FO]=findpeaks(-RStance)


max_gait_cycle_length_left = max(diff(left_FS));
max_gait_cycle_length_right = max(diff(right_FS));


%% For muscles

labels_muscle = {'GLU','HF','HAM','VAS','GAS','SOL','TA'};

for muscle = 1:length(labels_muscle)
    for cycle = 1:length(left_FS)-1
        current_muscle_left = mRFX.(['LMuscle' labels_muscle{muscle}]);
        gait_to_store_left = [current_muscle_left(left_FS(cycle):left_FS(cycle+1))' NaN([1 max_gait_cycle_length_left+1-length(current_muscle_left(left_FS(cycle):left_FS(cycle+1)))])];
        gait_cycles.(['LMuscle' labels_muscle{muscle}]).divided(cycle,:) = gait_to_store_left;
        
        current_muscle_right = mRFX.(['RMuscle' labels_muscle{muscle}]);
        gait_to_store_right = [current_muscle_right(right_FS(cycle):right_FS(cycle+1))' NaN([1 max_gait_cycle_length_right+1-length(current_muscle_right(right_FS(cycle):right_FS(cycle+1)))])];
        gait_cycles.(['RMuscle' labels_muscle{muscle}]).divided(cycle,:) = gait_to_store_right;
    end
end

for muscle = 1:length(labels_muscle)
    gait_cycles.(['LMuscle' labels_muscle{muscle}]).mean_activity = nanmean(gait_cycles.(['LMuscle' labels_muscle{muscle}]).divided);
    gait_cycles.(['LMuscle' labels_muscle{muscle}]).std_activity = nanstd(gait_cycles.(['LMuscle' labels_muscle{muscle}]).divided);
    
    gait_cycles.(['RMuscle' labels_muscle{muscle}]).mean_activity = nanmean(gait_cycles.(['RMuscle' labels_muscle{muscle}]).divided);
    gait_cycles.(['RMuscle' labels_muscle{muscle}]).std_activity = nanstd(gait_cycles.(['RMuscle' labels_muscle{muscle}]).divided);
    % To plot
    figure();
    vec_idx_left = 0:1:max_gait_cycle_length_left;
    vec_idx_right = 0:1:max_gait_cycle_length_right;
    
    normalized_vec_left = (vec_idx_left./max_gait_cycle_length_left)*100;
    normalized_vec_right = (vec_idx_right./max_gait_cycle_length_right)*100;
    
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
    
    legend('Left mean','Std left','Right mean','Std right');
    ax = gca;
    ax.FontSize = 24;
    
    XMIN = 0;
    XMAX = 100;
    YMIN = -inf;
    YMAX = inf;
    axis([XMIN XMAX YMIN YMAX]);
    title(labels_muscle{muscle});
    xlabel('(% Gait Cycle)');
    ylabel('Muscle Activity');
end
%% For torques (TOOOOOO NORMALIZE FOR THE GAIT CYCLES --> CHANGE ALSO STD!!!)
labels_torque = {'Ankle','Hip','Knee'};

for torque = 1:length(labels_torque)
    for cycle = 1:length(left_FS)-1
        current_torque_left = mRFX.(['L' labels_torque{torque} 'Torque']);
        gait_to_store_left = [current_torque_left(left_FS(cycle):left_FS(cycle+1))' NaN([1 max_gait_cycle_length_left+1-length(current_torque_left(left_FS(cycle):left_FS(cycle+1)))])];
        gait_cycles.(['L' labels_torque{torque} 'Torque']).divided(cycle,:) = gait_to_store_left;
        
        current_torque_right = mRFX.(['R' labels_torque{torque} 'Torque']);
        gait_to_store_right = [current_torque_right(right_FS(cycle):right_FS(cycle+1))' NaN([1 max_gait_cycle_length_right+1-length(current_torque_right(right_FS(cycle):right_FS(cycle+1)))])];
        gait_cycles.(['R' labels_torque{torque} 'Torque']).divided(cycle,:) = gait_to_store_right;
    end
end

for torque = 1:length(labels_torque)
    gait_cycles.(['L' labels_torque{torque} 'Torque']).mean_activity = nanmean(gait_cycles.(['L' labels_torque{torque} 'Torque']).divided);
    gait_cycles.(['L' labels_torque{torque} 'Torque']).std_activity = nanstd(gait_cycles.(['L' labels_torque{torque} 'Torque']).divided);
    
    gait_cycles.(['R' labels_torque{torque} 'Torque']).mean_activity = nanmean(gait_cycles.(['R' labels_torque{torque} 'Torque']).divided);
    gait_cycles.(['R' labels_torque{torque} 'Torque']).std_activity = nanstd(gait_cycles.(['R' labels_torque{torque} 'Torque']).divided);
    % To plot
    figure();
    vec_idx_left = 0:1:max_gait_cycle_length_left;
    vec_idx_right = 0:1:max_gait_cycle_length_right;
    
    plot(gait_cycles.(['L' labels_torque{torque} 'Torque']).mean_activity,'r','LineWidth',1.2);
    hold on;
    fill_x = [vec_idx_left, fliplr(vec_idx_left)];
    fill_y = [gait_cycles.(['L' labels_torque{torque} 'Torque']).mean_activity - gait_cycles.(['L' labels_torque{torque} 'Torque']).std_activity, fliplr(gait_cycles.(['L' labels_torque{torque} 'Torque']).mean_activity + gait_cycles.(['L' labels_torque{torque} 'Torque']).std_activity)];
    patch(fill_x,fill_y,'r','EdgeColor','none');
    alpha(.2)
    
    plot(gait_cycles.(['R' labels_torque{torque} 'Torque']).mean_activity,'b','LineWidth',1.2);
    fill_x = [vec_idx_right, fliplr(vec_idx_right)];
    fill_y = [gait_cycles.(['R' labels_torque{torque} 'Torque']).mean_activity - gait_cycles.(['R' labels_torque{torque} 'Torque']).std_activity, fliplr(gait_cycles.(['R' labels_torque{torque} 'Torque']).mean_activity + gait_cycles.(['R' labels_torque{torque} 'Torque']).std_activity)];
    patch(fill_x,fill_y,'b','EdgeColor','none');
    alpha(.2)
    
    legend('Left mean','Std left','Right mean','Std right');
    ax = gca;
    ax.FontSize = 24;
    
    XMIN = 0;
    XMAX = max([length(gait_cycles.(['L' labels_torque{torque} 'Torque']).mean_activity) length(gait_cycles.(['R' labels_torque{torque} 'Torque']).mean_activity)]);
    YMIN = -inf;
    YMAX = inf;
    axis([XMIN XMAX YMIN YMAX]);
    title(labels_torque{torque});
    xlabel('Time idx');
    ylabel('Torque');
end
%% For Angles

labels_angle = {'Ankle','Hip','Knee'};

for angle = 1:length(labels_angle)
    for cycle = 1:length(left_FS)-1
        current_angle_left = mRFX.(['L' labels_angle{angle} 'Angle']);
        gait_to_store_left = [current_angle_left(left_FS(cycle):left_FS(cycle+1))' NaN([1 max_gait_cycle_length_left+1-length(current_angle_left(left_FS(cycle):left_FS(cycle+1)))])];
        gait_cycles.(['L' labels_angle{angle} 'Angle']).divided(cycle,:) = gait_to_store_left;
        
        current_angle_right = mRFX.(['R' labels_angle{angle} 'Angle']);
        gait_to_store_right = [current_angle_right(right_FS(cycle):right_FS(cycle+1))' NaN([1 max_gait_cycle_length_right+1-length(current_angle_right(right_FS(cycle):right_FS(cycle+1)))])];
        gait_cycles.(['R' labels_angle{angle} 'Angle']).divided(cycle,:) = gait_to_store_right;
    end
end

for angle = 1:length(labels_angle)
    gait_cycles.(['L' labels_angle{angle} 'Angle']).mean_activity = nanmean(gait_cycles.(['L' labels_angle{angle} 'Angle']).divided);
    gait_cycles.(['L' labels_angle{angle} 'Angle']).std_activity = nanstd(gait_cycles.(['L' labels_angle{angle} 'Angle']).divided);
    
    gait_cycles.(['R' labels_angle{angle} 'Angle']).mean_activity = nanmean(gait_cycles.(['R' labels_angle{angle} 'Angle']).divided);
    gait_cycles.(['R' labels_angle{angle} 'Angle']).std_activity = nanstd(gait_cycles.(['R' labels_angle{angle} 'Angle']).divided);
    
    % To plot
    figure();
    vec_idx_left = 0:1:max_gait_cycle_length_left;
    vec_idx_right = 0:1:max_gait_cycle_length_right;
    
    plot(gait_cycles.(['L' labels_angle{angle} 'Angle']).mean_activity,'r','LineWidth',1.2);
    hold on;
    fill_x = [vec_idx_left, fliplr(vec_idx_left)];
    fill_y = [gait_cycles.(['L' labels_angle{angle} 'Angle']).mean_activity - gait_cycles.(['L' labels_angle{angle} 'Angle']).std_activity, fliplr(gait_cycles.(['L' labels_angle{angle} 'Angle']).mean_activity + gait_cycles.(['L' labels_angle{angle} 'Angle']).std_activity)];
    patch(fill_x,fill_y,'r','EdgeColor','none');
    alpha(.2)
    
    plot(gait_cycles.(['R' labels_angle{angle} 'Angle']).mean_activity,'b','LineWidth',1.2);
    fill_x = [vec_idx_right, fliplr(vec_idx_right)];
    fill_y = [gait_cycles.(['R' labels_angle{angle} 'Angle']).mean_activity - gait_cycles.(['R' labels_angle{angle} 'Angle']).std_activity, fliplr(gait_cycles.(['R' labels_angle{angle} 'Angle']).mean_activity + gait_cycles.(['R' labels_angle{angle} 'Angle']).std_activity)];
    patch(fill_x,fill_y,'b','EdgeColor','none');
    alpha(.2)
    
    legend('Left mean','Std left','Right mean','Std right');
    ax = gca;
    ax.FontSize = 24;
    
    XMIN = 0;
    XMAX = max([length(gait_cycles.(['L' labels_angle{angle} 'Angle']).mean_activity) length(gait_cycles.(['R' labels_angle{angle} 'Angle']).mean_activity)]);
    YMIN = -inf;
    YMAX = inf;
    axis([XMIN XMAX YMIN YMAX]);
    title(labels_angle{angle});
    xlabel('Time idx');
    ylabel('Angle');
end

