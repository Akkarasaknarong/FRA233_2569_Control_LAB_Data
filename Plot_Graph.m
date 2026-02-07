clear; clc; close all;

folderPath = 'C:\Users\Akkarasaknarong\Documents\GitHub\LAB_Control_Data\Data_Difference_PWM_frequency';

files = {'Ramp_0.1_200Hz_rec2.mat', ...
         'Ramp_0.1_2000Hz_rec2.mat', ...
         'Ramp_0.1_20000Hz_rec2.mat'};

lineColors = {'r', 'g', 'b'}; 
legendNames = {'200 Hz', '2000 Hz', '20000 Hz'};

figure('Name', 'Comparison of 3 Records', 'Color', 'w');
hold on;

windowSize = 700;

for i = 1:length(files)
    fullPath = fullfile(folderPath, files{i});
    
    if ~isfile(fullPath)
        continue;
    end
    
    loaded = load(fullPath);
    
    if isfield(loaded, 'data')
        simData = loaded.data;
    elseif isfield(loaded, 'motor_data')
         simData = loaded.motor_data;
    else
        vars = fieldnames(loaded);
        simData = loaded.(vars{1});
    end

    t = simData{1}.Values.Time;
    y = simData{1}.Values.Data;

    % y_main = smoothdata(y, 'movmean', smoothingWindow);
    % plot(t, y, 'Color', lineColors{i}, 'LineWidth', 1.5);

    y_smooth = smoothdata(y, 'movmean', windowSize);
    plot(t, y_smooth, 'Color', lineColors{i}, 'LineWidth', 2.0);
end

title('Comparison of PWM Frequencies');
xlabel('Time (s)');
ylabel('Angular_velocity (rad/s)');
legend(legendNames);
grid on;
hold off;