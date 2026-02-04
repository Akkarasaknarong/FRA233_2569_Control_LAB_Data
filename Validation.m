
%% ================= LOAD FILE 1 =================
f1 = load('Validation_Step_100_test_80_rec3.mat');
d1 = f1.data;

t1    = squeeze(d1{1}.Values.Time);
velo1 = squeeze(d1{1}.Values.Data);

if length(d1) >= 2
    input1 = squeeze(d1{2}.Values.Data);
else
    warning('File 1 has no input signal. Using zeros.');
    input1 = zeros(size(velo1));
end
%% ================= LOAD FILE 2 =================
f2 = load('Step_80Percent_Rec3.mat');
d2 = f2.data;

t2    = squeeze(d2{1}.Values.Time);
velo2 = squeeze(d2{1}.Values.Data);

if length(d2) >= 2
    input2 = squeeze(d2{2}.Values.Data);
else
    warning('File 2 has no input signal. Using zeros.');
    input2 = zeros(size(velo2));
end

%% ================= PLOT ORIGINAL SIGNALS =================
figure;
plot(t1, velo1, 'b', 'LineWidth', 1.5); hold on;
plot(t2, velo2, 'r', 'LineWidth', 1.5);
title('Velocity Comparison');
xlabel('Time (s)'); ylabel('Velocity');
legend('Model','Real');
grid on;
%% ================= TIME ALIGNMENT =================
t_start = max(t1(1), t2(1));
t_end   = min(t1(end), t2(end));
t_common = linspace(t_start, t_end, 5000);

velo1_i  = interp1(t1, velo1, t_common, 'linear');
velo2_i  = interp1(t2, velo2, t_common, 'linear');
input1_i = interp1(t1, input1, t_common, 'linear');
input2_i = interp1(t2, input2, t_common, 'linear');

%% ================= RMS ERROR =================
rms_velo  = sqrt(mean((velo1_i - velo2_i).^2));
rms_input = sqrt(mean((input1_i - input2_i).^2));

fprintf('\n===== RMS ERROR =====\n');
fprintf('Velocity RMS Error = %.6f\n', rms_velo);
fprintf('Input RMS Error    = %.6f\n', rms_input);

%% ================= NORMALIZED RMS (%) =================
nrms_velo  = (rms_velo  / max(abs(velo1_i)))  * 100;
nrms_input = (rms_input / max(abs(input1_i))) * 100;

fprintf('\n===== NORMALIZED RMS ERROR (%%) =====\n');
fprintf('Velocity NRMSE = %.2f %%\n', nrms_velo);
fprintf('Input NRMSE    = %.2f %%\n', nrms_input);
