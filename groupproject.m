
%this is the initial data
data = readtable('eye_adhd (new).xlsx');

%finding the means + std for each group
meanseyeandmouth = varfun(@mean, data, 'InputVariables', {'PFMR_D', 'PFER_D', 'PFMR_F', 'PFER_F', 'PFMR_H', 'PFER_H', 'PFMR_A', 'PFER_A', 'PFMR_S', 'PFER_S', 'PFMR_N', 'PFER_N'});

stdeyeandmouth = varfun(@std, data, 'InputVariables', {'PFMR_D', 'PFER_D', 'PFMR_F', 'PFER_F', 'PFMR_H', 'PFER_H', 'PFMR_A', 'PFER_A', 'PFMR_S', 'PFER_S', 'PFMR_N', 'PFER_N'});

comeyeandmouth = [meanseyeandmouth, stdeyeandmouth(:, 2:end)]; %combined table


means_corr = varfun(@mean, data, 'InputVariables', {'dcorr', 'fcorr', 'hcorr', 'acorr', 'scorr', 'ncorr', 'totalcorr'});

std_corr = varfun(@std, data, 'InputVariables', {'dcorr', 'fcorr', 'hcorr', 'acorr', 'scorr', 'ncorr', 'totalcorr'});

comcorr = [means_corr, std_corr(:, 2:end)]; %combined table


means_totals = varfun(@mean, data, 'InputVariables', {'dtotal', 'ftotal', 'htotal', 'atotal', 'stotal', 'ntotal'});

std_totals = varfun(@std, data, 'InputVariables', {'dtotal', 'ftotal', 'htotal', 'atotal', 'stotal', 'ntotal'});

comtotals = [means_totals, std_totals(:, 2:end)]; %combined table


means_ToM = varfun(@mean, data, 'InputVariables', {'FPRT_C', 'RMET_C'});
std_ToM = varfun(@std, data, 'InputVariables', {'FPRT_C', 'RMET_C'});
comToM = [means_ToM, std_ToM(:, 2:end)]; %combined table


means_adhdsym = varfun(@mean, data, 'InputVariables', {'tur', 'oppositional', 'inattentive', 'hyperactive', 'ADHDIndex'});
std_adhdsym = varfun(@std, data, 'InputVariables', {'tur', 'oppositional', 'inattentive', 'hyperactive', 'ADHDIndex'});
comadhdsym = [means_adhdsym, std_adhdsym(:, 2:end)]; %combined table

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%distribution tests to determine which statistical tests to use%%%%

%reads table and assigns name
distributiontests = readtable('annette distribution tests.xlsx');

%finds length of the table
columns = width(distributiontests);

%initializing
hresults = zeros(1, columns); 
p_values = zeros(1, columns);  

for tester = 1:columns
    Data = distributiontests{:, tester};  
    hresults(tester) = kstest(Data); 
end

disp(hresults);
%none were regularly distributed, so I am going to use a Spearman's test

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%correlation tests, Spearman's test, part 1- ADHD ToM versus Recognition%%

%first test round
AdhdToMCorr = readtable('ADHD ToM_Recognition corr.xlsx');

Fscore = AdhdToMCorr.adhd; % Fscore column as a vector

columnnames = AdhdToMCorr.Properties.VariableNames;
results = table(); % empty table for the results

% looping through 2-8
for ii = 2:8
    
    NumberCorrect = AdhdToMCorr{:, ii};

    % Spearman correlation
    [rho, p] = corr(Fscore, NumberCorrect, 'Type', 'Spearman');

    % creating a table for the results
    if p < 0.05
        results = [results; table(string(columnnames{ii}), rho, p, 'VariableNames', {'test', 'Rho', 'PValue'})];
    end
end


if isempty(results)
    disp('no significance');
else
    disp(results);
end

%second test round

Rscore = AdhdToMCorr.adhd_1; % Fscore column as a vector

columnnames = AdhdToMCorr.Properties.VariableNames;
results1 = table(); % empty table for the results

% looping through 11-17
for jj = 11:17
    
    NumberCorrect1 = AdhdToMCorr{:, jj};

    % Spearman correlation
    [rho, p] = corr(Rscore, NumberCorrect1, 'Type', 'Spearman');

    % creating a table for the results
    if p < 0.05
        results1 = [results1; table(string(columnnames{jj}), rho, p, 'VariableNames', {'test1', 'Rho', 'PValue'})];
    end
end


if isempty(results1)
    disp('no significance');
else
    disp(results1);
end


%correlation tests, spearman's test, part 2- ADHD/Control ToM versus Fixation
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
% ADHD F Score

AdhdToMFixation = readtable('ToM_Fixation Parameter ADHD.xlsx');

Fscore = AdhdToMFixation.FScore; % Fscore column as a vector

columnnames = AdhdToMFixation.Properties.VariableNames;
results2 = table(); % empty table for the results

% looping through 2-13
for aa = 2:13
    
    Scores = AdhdToMFixation{:, aa};

    % Spearman correlation
    [rho, p] = corr(Fscore, Scores, 'Type', 'Spearman');

if p < 0.05
        results2 = [results2; table(string(columnnames{aa}), rho, p, 'VariableNames', {'test2', 'Rho', 'PValue'})];
    end
end


if isempty(results2)
    disp('no significance');
else
    disp(results2);
end


%ADHD R Score

Rscore = AdhdToMFixation.RScore; % Fscore column as a vector

columnnames = AdhdToMFixation.Properties.VariableNames;
results3 = table(); % empty table for the results

% looping through 2-13
for bb = 15:26
    
    Scores = AdhdToMFixation{:, bb};

    % Spearman correlation
    [rho, p] = corr(Rscore, Scores, 'Type', 'Spearman');

if p < 0.05
        results3 = [results3; table(string(columnnames{bb}), rho, p, 'VariableNames', {'test3', 'Rho', 'PValue'})];
    end
end


if isempty(results3)
    disp('no significance');
else
    disp(results3);
end

%Control F Score

ControlToMFixation = readtable('ToM_Fixation Parameter control.xlsx');

Fscore = ControlToMFixation.fScore; % Fscore column as a vector

columnnames = ControlToMFixation.Properties.VariableNames;
results4 = table(); % empty table for the results

% looping through 2-13
for cc = 2:13
    
    Scores = ControlToMFixation{:, cc};

    % Spearman correlation
    [rho, p] = corr(Fscore, Scores, 'Type', 'Spearman');

if p < 0.05
        results4 = [results4; table(string(columnnames{cc}), rho, p, 'VariableNames', {'test4', 'Rho', 'PValue'})];
    end
end


if isempty(results4)
    disp('no significance');
else
    disp(results4);
end

%Control R Score

Rscore = ControlToMFixation.rScore; 

columnnames = ControlToMFixation.Properties.VariableNames;
results5 = table(); 


for dd = 15:26
    
    Scores = ControlToMFixation{:, dd};

  
    [rho, p] = corr(Rscore, Scores, 'Type', 'Spearman');

if p < 0.05
        results5 = [results5; table(string(columnnames{dd}), rho, p, 'VariableNames', {'test5', 'Rho', 'PValue'})];
    end
end


if isempty(results5)
    disp('no significance');
else
    disp(results5);
end


%correlation tests, spearman's test, part 3- ADHD symptoms/Recognition

AdhdSymptomRecognition = readtable('adhd symptoms_recognition corr.xlsx');

%first test
oppositional = AdhdSymptomRecognition.oppositional; 

columnnames = AdhdSymptomRecognition.Properties.VariableNames;
resultsx = table(); 

for ee = 5:11
    
    numcorrect = AdhdSymptomRecognition{:, ee};

    [rho, p] = corr(oppositional, numcorrect, 'Type', 'Spearman');

if p < 0.05
        resultsx = [resultsx; table(string(columnnames{ee}), rho, p, 'VariableNames', {'testx', 'Rho', 'PValue'})];
    end
end


if isempty(resultsx)
    disp('no significance');
else
    disp(resultsx);
end

%second test
inattentive = AdhdSymptomRecognition.inattentive; 

columnnames = AdhdSymptomRecognition.Properties.VariableNames;
results6 = table(); 

for ff = 5:11
    
    numcorrect = AdhdSymptomRecognition{:, ff};

    [rho, p] = corr(inattentive, numcorrect, 'Type', 'Spearman');

 if p < 0.05
        results6 = [results6; table(string(columnnames{ff}), rho, p, 'VariableNames', {'test6', 'Rho', 'PValue'})];
    end
end


if isempty(results6)
    disp('no significance');
else
    disp(results6);
end

%third test
ADHDIndex = AdhdSymptomRecognition.ADHDIndex; 

columnnames = AdhdSymptomRecognition.Properties.VariableNames;
results7 = table(); 

for gg = 5:11
    
    numcorrect = AdhdSymptomRecognition{:, gg};

    [rho, p] = corr(ADHDIndex, numcorrect, 'Type', 'Spearman');

 
  if p < 0.05
        results7 = [results7; table(string(columnnames{gg}), rho, p, 'VariableNames', {'test7', 'Rho', 'PValue'})];
    end
end


if isempty(results7)
    disp('no significance');
else
    disp(results7);
end

%fourth test
hyperactive = AdhdSymptomRecognition.hyperactive; 

columnnames = AdhdSymptomRecognition.Properties.VariableNames;
results8 = table(); 

for hh = 5:11
    
    numcorrect = AdhdSymptomRecognition{:, hh};

    [rho, p] = corr(hyperactive, numcorrect, 'Type', 'Spearman');

 
if p < 0.05
        results8 = [results8; table(string(columnnames{hh}), rho, p, 'VariableNames', {'test8', 'Rho', 'PValue'})];
    end
end


if isempty(results8)
    disp('no significance');
else
    disp(results8);
end

%correlation tests, spearman's test, part 4- ADHD symptoms/fixation par


AdhdSymptomsFixation = readtable('adhd symptoms_fixation.xlsx');

%first test
oppositional1 = AdhdSymptomsFixation.oppositional; 

columnnames = AdhdSymptomsFixation.Properties.VariableNames;
results9 = table(); 

for kk = 5:16
    
    numcorrect = AdhdSymptomsFixation{:, kk};

    [rho, p] = corr(oppositional1, numcorrect, 'Type', 'Spearman');

 if p < 0.05
        results9 = [results9; table(string(columnnames{kk}), rho, p, 'VariableNames', {'test9', 'Rho', 'PValue'})];
    end
end


if isempty(results9)
    disp('no significance');
else
    disp(results9);
end

%second test
inattentive1 = AdhdSymptomsFixation.inattentive; 

columnnames = AdhdSymptomsFixation.Properties.VariableNames;
results10 = table(); 

for ll = 5:16
    
    numcorrect = AdhdSymptomsFixation{:, ll};

    [rho, p] = corr(inattentive1, numcorrect, 'Type', 'Spearman');

if p < 0.05
        results10 = [results10; table(string(columnnames{ll}), rho, p, 'VariableNames', {'test10', 'Rho', 'PValue'})];
    end
end


if isempty(results10)
    disp('no significance');
else
    disp(results10);
end

%third test
ADHDIndex1 = AdhdSymptomsFixation.ADHDIndex; 

columnnames = AdhdSymptomsFixation.Properties.VariableNames;
results11 = table(); 

for mm = 5:16
    
    numcorrect = AdhdSymptomsFixation{:, mm};

    [rho, p] = corr(ADHDIndex1, numcorrect, 'Type', 'Spearman');

 if p < 0.05
        results11 = [results11; table(string(columnnames{mm}), rho, p, 'VariableNames', {'test11', 'Rho', 'PValue'})];
    end
end


if isempty(results11)
    disp('no significance');
else
    disp(results11);
end

%fourth test

hyperactive1 = AdhdSymptomsFixation.hyperactive; 

columnnames = AdhdSymptomsFixation.Properties.VariableNames;
results12 = table(); 

for nn = 5:16
    
    numcorrect = AdhdSymptomsFixation{:, nn};

    [rho, p] = corr(hyperactive1, numcorrect, 'Type', 'Spearman');

 if p < 0.05
        results12 = [results12; table(string(columnnames{nn}), rho, p, 'VariableNames', {'test12', 'Rho', 'PValue'})];
    end
end


if isempty(results12)
    disp('no significance');
else
    disp(results12);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%after finding which ones were significant, I got a total of 13
%significant correlations. I thought it best to plot using scatterplots
%this section includes plots + analysis of results

%1 - Positive Correlation (PC- as one increases, the other also does)
figure;
scatter(AdhdToMCorr{:, 10}, AdhdToMCorr{:, 11}, 'filled');
xlabel('RScore'); 
ylabel('dcorr'); 
title('ADHD RScore vs dcorr')
lsline 
grid on;
%this shows a positive correlation between the ADHD group's R Score and
%their correct number of responses for the disgust expression

%2 - Negative Correlation (NC - as one increases, the other decreases)
figure;
scatter(AdhdToMFixation{:, 14}, AdhdToMFixation{:, 25}, 'filled');
xlabel('RScore'); 
ylabel('PFMR Neutral'); 
title('RScore vs PFMR Neutral')
lsline 
grid on;

%this shows a negative correlation between the ADHD group's R Score and
%their PFMR neutral scores

%3 - PC
figure;
scatter(AdhdSymptomRecognition{:, 1}, AdhdSymptomRecognition{:, 9}, 'filled');
xlabel('Oppositional'); 
ylabel('Sad Recognition Num Correct'); 
title('Oppositional vs Sad Recognition')
lsline 
grid on;

%4 - PC
figure;
scatter(AdhdSymptomRecognition{:, 2}, AdhdSymptomRecognition{:, 10}, 'filled');
xlabel('Inattentive'); 
ylabel('Neutral Recognition Num Correct'); 
title('Inattentive vs Neutral Recognition')
lsline 
grid on;


%5 - PC
figure;
scatter(AdhdSymptomRecognition{:, 3}, AdhdSymptomRecognition{:, 9}, 'filled');
xlabel('ADHD Index'); 
ylabel('Sad Recognition Num Correct'); 
title('ADHD Index vs Sad Recognition')
lsline 
grid on;

%6 - PC
figure;
scatter(AdhdSymptomRecognition{:, 4}, AdhdSymptomRecognition{:, 9}, 'filled');
xlabel('Hyperactive'); 
ylabel('Sad Recognition Num Correct'); 
title('Hyperactive vs Sad Recognition')
lsline 
grid on;

%7 - NC
figure;
scatter(AdhdSymptomsFixation{:, 1}, AdhdSymptomsFixation{:, 5}, 'filled');
xlabel('oppositional'); 
ylabel('PFMR Disgusted'); 
title('Oppositional vs Disgust Mouth Region Score')
lsline 
grid on;

%8 - NC
figure;
scatter(AdhdSymptomsFixation{:, 1}, AdhdSymptomsFixation{:, 7}, 'filled');
xlabel('Oppositional'); 
ylabel('PFMR Fear'); 
title('Oppositional vs Fear Mouth Region Score')
lsline 
grid on;

%9 - NC
figure;
scatter(AdhdSymptomsFixation{:, 1}, AdhdSymptomsFixation{:, 15}, 'filled');
xlabel('Oppositional'); 
ylabel('PFMR Neutral'); 
title('Oppositional vs Neutral Mouth Region Score')
lsline 
grid on;

%10 - PC
figure;
scatter(AdhdSymptomsFixation{:, 2}, AdhdSymptomsFixation{:, 6}, 'filled');
xlabel('Inattentive'); 
ylabel('PFER Disgusted'); 
title('Oppositional vs Disgust Eye Region Score')
lsline 
grid on;

%11 - PC
figure;
scatter(AdhdSymptomsFixation{:, 3}, AdhdSymptomsFixation{:, 6}, 'filled');
xlabel('ADHD Index'); 
ylabel('PFER Disgusted'); 
title('ADHD Index vs Disgust Eye Region Score')
lsline 
grid on;

%12 - NC
figure;
scatter(AdhdSymptomsFixation{:, 4}, AdhdSymptomsFixation{:, 7}, 'filled');
xlabel('Hyperactive'); 
ylabel('PFMR Fear'); 
title('Hyperactive vs Fear Mouth Region Score')
lsline 
grid on;

%13 - NC
figure;
scatter(AdhdSymptomsFixation{:, 4}, AdhdSymptomsFixation{:, 15}, 'filled');
xlabel('Hyperactive'); 
ylabel('PFMR Neutral'); 
title('Hyperactive vs Neutral Mouth Region Score')
lsline 
grid on;

%though these all showed significant correlation, the degree of
%significance varies (P value closer to .05 vs farther away). Further
%analysis would be needed to determine whether or not these variables are
%correlated due to causation or whether these results can be replicated or
%not
%End! Thank you for reading
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%