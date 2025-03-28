control_data = readtable('eye_control (new) (1).xlsx', 'PreserveVariableNames', true);
adhd_data = readtable('eye_adhd (new) (2).xlsx', 'PreserveVariableNames', true);

disp(control_data.Properties.VariableNames);
disp(adhd_data.Properties.VariableNames);

%Now I will determine the distribution for the data for statistical analysis. 

%I am creating a for loop so that I do not have to run each variable
%independently


variables = {...
    'd-PFMR', 'f-PFMR', 'h-PFMR', 'a-PFMR', 's-PFMR', 'n-PFMR',...
    'd-PFER', 'f-PFER', 'h-PFER', 'a-PFER', 's-PFER', 'n-PFER',...
    'd-PFTR', 'f-PFTR', 'h-PFTR', 'a-PFTR', 's-PFTR', 'n-PFTR',...
    'dcorr', 'fcorr', 'hcorr', 'acorr', 'scorr', 'ncorr', ...
    'totalcorr', 'FPRT-C', 'RMET-C'...
    };

normality_results = table('Size', [length(variables), 5], ...
    'VariableTypes', {'string', 'double', 'double', 'double', 'double'}, ...
    'VariableNames', {'Variable', 'Control_H', 'Control_P', 'ADHD_h', 'ADHD_p'});

for i=1:length(variables)
    var = variables{i};

    x = control_data.(var);
    y = adhd_data.(var);

    x = x(~isnan(x));
    y = y(~isnan(y));

    [h_control, p_control] = kstest(x);
    [h_adhd, p_adhd] = kstest(y);

    normality_results(i, :) = {var, h_control, p_control, h_adhd, p_adhd};
end

disp(normality_results);

%now since all of the data is NOT equally distributed, for our
%statistical analysis, we will have to use non-parametric tests
%to compare the ADHD and control group%

%to run this test, we will create another for-loop to try and
%run them all simultaneously%

%I will be using a mann-whitney U test

mw_results = table('Size', [length(variables), 3], ...
    'VariableTypes', {'string', 'double', 'double'}, ...
    'VariableNames', {'Variable','U-Statistic', 'P-Value'});

for i = 1:length(variables)
    var = variables{i};

    x = control_data.(var);
    y = adhd_data.(var);

    x = x(~isnan(x));
    y = y(~isnan(y));

    p = ranksum(x,y);
    u_statistic = NaN;

    mw_results(i, :) = {var, u_statistic, p};
end
disp(mw_results);

%creating a for loop to create box plots with the significant results%

sig_vars = mw_results.Variable(mw_results.("P-Value") < 0.05);

for i = 1:length(sig_vars)
    var = sig_vars{i};

    x = control_data.(var);
    y = adhd_data.(var);

    x = x(~isnan(x));
    y = y(~isnan(y));

    figure;
    boxplot([x; y], [repmat({'Control'}, length(x), 1); repmat({'ADHD'}, length(y), 1)]);
    title(['Comparison of ', var, ' between Control and ADHD']);
    ylabel(var);
    xticklabels({'Control', 'ADHD'});
end
