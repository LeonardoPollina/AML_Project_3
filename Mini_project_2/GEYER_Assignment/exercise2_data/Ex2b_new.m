
clc;
clear;

muscles = {'HAM','TA','HFL'};
threshold = 200;
XMIN = 0;
XMAX = inf;
YMIN = -1;
YMAX = 2;

% Do you want to plot?
plot_flag = 0;

for muscle = 1:length(muscles)
    if strcmp(muscles{muscle},'HAM')
        labels = {'SensorNoise0.01','SensorNoise0.02','StimNoise0.009','StimNoise0.018','SensorNoise0.03','SensorNoise0.015','StimNoise0.01','StimNoise0.02',};
        names = {'SensorNoise0_01','SensorNoise0_02','StimNoise0_009','StimNoise0_018','SensorNoise0_03','SensorNoise0_015','StimNoise0_01','StimNoise0_02',};
    elseif strcmp(muscles{muscle},'TA')
        labels = {'SensorNoise0.02','SensorNoise0.04','StimNoise0.29','StimNoise0.58','SensorNoise0.010','SensorNoise0.019','StimNoise0.3','StimNoise0.15',};
        names = {'SensorNoise0_02','SensorNoise0_04','StimNoise0_29','StimNoise0_58','SensorNoise0_010','SensorNoise0_019','StimNoise0_3','StimNoise0_15',};
    elseif strcmp(muscles{muscle},'HFL')
        labels = {'SensorNoise0.055','SensorNoise0.11','StimNoise0.14','StimNoise0.28','SensorNoise0.04','SensorNoise0.08','StimNoise0.04','StimNoise0.08',};
        names = {'SensorNoise0_055','SensorNoise0_11','StimNoise0_14','StimNoise0_28','SensorNoise0_04','SensorNoise0_09','StimNoise0_04','StimNoise0_08',};
    end
    
    for l = 1:length(labels)
        if (l <= 4)
            current_file = ['asym' muscles{muscle} labels{l}];
            current_name = ['asym' muscles{muscle} names{l}];
        else
            current_file = ['sym' muscles{muscle} labels{l}];
            current_name = ['asym' muscles{muscle} names{l}];
        end
        load([current_file '.mat']);
        all_struct_noise.(muscles{muscle}).(current_name).mRFX = mRFX;
        
        % RIGHT
        all_struct_noise.(muscles{muscle}).(current_name).RStance = mRFX.RStance;
        
        important_points_right = diff(all_struct_noise.(muscles{muscle}).(current_name).RStance);
        swing_to_stance_right = find(important_points_right == 1);
        stance_to_swing_right = find(important_points_right == -1);
        
        if (stance_to_swing_right(1) < swing_to_stance_right(1))
            temp_right = stance_to_swing_right(2:end);
            clear stance_to_swing_right;
            stance_to_swing_right = temp_right;
        end
        for idx_right = 1:min([length(swing_to_stance_right) length(stance_to_swing_right)])
            if (stance_to_swing_right(idx_right) - swing_to_stance_right(idx_right) > threshold)
                right_FO_temp(idx_right) = stance_to_swing_right(idx_right) + 1;
                right_FS_temp(idx_right) = swing_to_stance_right(idx_right) + 1;
            end
        end
        
        all_struct_noise.(muscles{muscle}).(current_name).right_FO = right_FO_temp(right_FO_temp ~= 0);
        all_struct_noise.(muscles{muscle}).(current_name).right_FS = right_FS_temp(right_FS_temp ~= 0);
        
        clear right_FO_temp;
        clear right_FS_temp;
        
        if (plot_flag)
            figure;
            plot(all_struct_noise.(muscles{muscle}).(current_name).RStance);
            hold on;
            plot(all_struct_noise.(muscles{muscle}).(current_name).right_FO,all_struct_noise.(muscles{muscle}).(current_name).RStance(all_struct_noise.(muscles{muscle}).(current_name).right_FO),'bo');
            plot(all_struct_noise.(muscles{muscle}).(current_name).right_FS,all_struct_noise.(muscles{muscle}).(current_name).RStance(all_struct_noise.(muscles{muscle}).(current_name).right_FS),'ro');
            axis([XMIN XMAX YMIN YMAX]);
            legend('','FO','FS');
            title(['Right ' current_file]);
        end

        % LEFT
        all_struct_noise.(muscles{muscle}).(current_name).LStance = mRFX.LStance;
        
        important_points_left = diff(all_struct_noise.(muscles{muscle}).(current_name).LStance);
        swing_to_stance_left = find(important_points_left == 1);
        stance_to_swing_left = find(important_points_left == -1);
        
        if (stance_to_swing_left(1) < swing_to_stance_left(1))
            temp_left = stance_to_swing_left(2:end);
            clear stance_to_swing_left;
            stance_to_swing_left = temp_left;
        end
        for idx_left = 1:min([length(swing_to_stance_left) length(stance_to_swing_left)])
            if (stance_to_swing_left(idx_left) - swing_to_stance_left(idx_left) > threshold)
                left_FO_temp(idx_left) = stance_to_swing_left(idx_left) + 1;
                left_FS_temp(idx_left) = swing_to_stance_left(idx_left) + 1;
            end
        end
        
        all_struct_noise.(muscles{muscle}).(current_name).left_FO = left_FO_temp(left_FO_temp ~= 0);
        all_struct_noise.(muscles{muscle}).(current_name).left_FS = left_FS_temp(left_FS_temp ~= 0);
        
        clear left_FO_temp;
        clear left_FS_temp;
        
        if (plot_flag)
            figure;
            plot(all_struct_noise.(muscles{muscle}).(current_name).LStance);
            hold on;
            plot(all_struct_noise.(muscles{muscle}).(current_name).left_FO,all_struct_noise.(muscles{muscle}).(current_name).LStance(all_struct_noise.(muscles{muscle}).(current_name).left_FO),'bo');
            plot(all_struct_noise.(muscles{muscle}).(current_name).left_FS,all_struct_noise.(muscles{muscle}).(current_name).LStance(all_struct_noise.(muscles{muscle}).(current_name).left_FS),'ro');
            axis([XMIN XMAX YMIN YMAX]);
            legend('','FO','FS');
            title(['Left ' current_file]);
        end
        
        % Computation of variables 
        gaitcycle_left = diff(all_struct_noise.(muscles{muscle}).(current_name).left_FS);
        gaitcycle_right = diff(all_struct_noise.(muscles{muscle}).(current_name).left_FS);
        gaitcycle_vec = [gaitcycle_left gaitcycle_right];
        all_struct_noise.(muscles{muscle}).(current_name).mean_gait_cycle_duration = mean(gaitcycle_vec./1000);
        all_struct_noise.(muscles{muscle}).(current_name).cadence = (1/all_struct_noise.(muscles{muscle}).(current_name).mean_gait_cycle_duration);
        all_struct_noise.(muscles{muscle}).(current_name).speed = power(all_struct_noise.(muscles{muscle}).(current_name).cadence/0.85,2);
        all_struct_noise.(muscles{muscle}).(current_name).steplength = all_struct_noise.(muscles{muscle}).(current_name).mean_gait_cycle_duration*all_struct_noise.(muscles{muscle}).(current_name).speed/2;
    end
end

save('Struct_values_with_noise.mat','all_struct_noise');


