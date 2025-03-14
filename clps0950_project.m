summary(data_Control)
%%Recreating Stats for Table 1%%
%%Mean, STD, and Median of ToM Tests%%
mean_fscore = mean(data_Control.fscore);
mean_rscore = mean(data_Control.rscore);
std_fscore = std(data_Control.fscore);
std_rscore = std(data_Control.rscore);
median_fscore = median(data_Control.fscore);
median_rscore = median(data_Control.rscore);
%%Mean & STD of Age Demographics%%
mean_age = mean(data_Control.a);
std_age = std(data_Control.a);
%%Mean & STD of Correct Responses to Emotional Facial Recognition Task%%
mean_dcorr = mean(data_Control.dcorr);
std_dcorr = std(data_Control.dcorr);
mean_fcorr = mean(data_Control.fcorr);
std_fcorr = std(data_Control.fcorr);
mean_hcorr = mean(data_Control.hcorr);
std_hcorr = std(data_Control.hcorr);
mean_acorr = mean(data_Control.acorr);
std_acorr = std(data_Control.acorr);
mean_scorr = mean(data_Control.scorr);
std_scorr = std(data_Control.scorr);
mean_ncorr = mean(data_Control.ncorr);
std_ncorr = std(data_Control.ncorr);
mean_totalcorr = mean(data_Control.totalcorr);
std_totalcorr = std(data_Control.totalcorr);
%%Creating a table similar to Table 1%%
% Define Variable Categories
Categories = {'Age (years)'; ' '; ...
              'Emotion Facial Recognition Accuracy'; 'Happy'; 'Angry'; 'Fearful'; ...
              'Sad'; 'Disgusted'; 'Neutral'; 'Total'; ' '; ...
              'ToM Test'; 'RMET-C'; 'FPRT-C'};
% Control Mean ± SD
Control = {'10.6 ± 1.8'; ' '; ...
           ' '; '5.8 ± 0.5'; '5.2 ± 0.9'; '4.9 ± 1.5'; '4.1 ± 1.7'; '5.5 ± 0.9'; '5.5 ± 1.0'; '31.0 ± 3.3'; ' '; ...
           ' '; '18.6 ± 3.5'; '14.1 ± 1.9'};

% Creating  Table
SummaryTable = table(Categories, Control, ...
                     'VariableNames', {'Parameter', 'Control'});
disp(SummaryTable)

