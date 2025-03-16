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

%%Calculating the means + SEM for all fixation times%%

%disgust%
mean_dPFMR = mean(data_Control.d_PFMR);
std_dPFMR = std(data_Control.d_PFMR);
mean_dPFER = mean(data_Control.d_PFER);
std_dPFER = std(data_Control.d_PFER);
mean_dPFTR = mean(data_Control.d_PFTR);
std_dPFTR = std(data_Control.d_PFTR);

%fear%
mean_fPFMR = mean(data_Control.f_PFMR);
std_fPFMR = std(data_Control.f_PFMR);
mean_fPFER = mean(data_Control.f_PFER);
std_fPFER = std(data_Control.f_PFER);
mean_fPFTR = mean(data_Control.f_PFTR);
std_fPFTR = std(data_Control.f_PFTR);

%happy%
mean_hPFMR = mean(data_Control.h_PFMR);
std_hPFMR = std(data_Control.h_PFMR);
mean_hPFER = mean(data_Control.h_PFER);
std_hPFER = std(data_Control.h_PFER);
mean_hPFTR = mean(data_Control.h_PFTR);
std_hPFTR = std(data_Control.h_PFTR);

%angry%
mean_aPFMR = mean(data_Control.a_PFMR);
std_aPFMR = std(data_Control.a_PFMR);
mean_aPFER = mean(data_Control.a_PFER);
std_aPFER = std(data_Control.a_PFER);
mean_aPFTR = mean(data_Control.a_PFTR);
std_aPFTR = std(data_Control.a_PFTR);

%sad%
mean_sPFMR = mean(data_Control.s_PFMR);
std_sPFMR = std(data_Control.s_PFMR);
mean_sPFER = mean(data_Control.s_PFER);
std_sPFER = std(data_Control.s_PFER);
mean_sPFTR = mean(data_Control.s_PFTR);
std_sPFTR = std(data_Control.s_PFTR);

%neutral%
mean_nPFMR = mean(data_Control.n_PFMR);
std_nPFMR = std(data_Control.n_PFMR);
mean_nPFER = mean(data_Control.n_PFER);
std_nPFER = std(data_Control.n_PFER);
mean_nPFTR = mean(data_Control.n_PFTR);
std_nPFTR = std(data_Control.n_PFTR);


