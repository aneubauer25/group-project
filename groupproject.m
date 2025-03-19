data = readtable('eye_adhd (new).xlsx');

means_eyeandmouth = varfun(@mean, data, 'InputVariables', {'PFMR_D', 'PFER_D', 'PFMR_F', 'PFER_F', 'PFMR_H', 'PFER_H', 'PFMR_A', 'PFER_A', 'PFMR_S', 'PFER_S', 'PFMR_N', 'PFER_N'});

std_eyeandmouth = varfun(@std, data, 'InputVariables', {'PFMR_D', 'PFER_D', 'PFMR_F', 'PFER_F', 'PFMR_H', 'PFER_H', 'PFMR_A', 'PFER_A', 'PFMR_S', 'PFER_S', 'PFMR_N', 'PFER_N'});

means_corr = varfun(@mean, data, 'InputVariables', {'dcorr', 'fcorr', 'hcorr', 'acorr', 'scorr', 'ncorr', 'totalcorr'});

std_corr = varfun(@std, data, 'InputVariables', {'dcorr', 'fcorr', 'hcorr', 'acorr', 'scorr', 'ncorr', 'totalcorr'});

means_totals = varfun(@mean, data, 'InputVariables', {'dtotal', 'ftotal', 'htotal', 'atotal', 'stotal', 'ntotal'});


std_totals = varfun(@std, data, 'InputVariables', {'dtotal', 'ftotal', 'htotal', 'atotal', 'stotal', 'ntotal'});

means_ToM = varfun(@mean, data, 'InputVariables', {'FPRT_C', 'RMET_C'});

std_ToM = varfun(@std, data, 'InputVariables', {'FPRT_C', 'RMET_C'});

means_adhdsym = varfun(@mean, data, 'InputVariables', {'tur', 'oppositional', 'inattentive', 'hyperactive', 'ADHDIndex'});

std_adhdsym = varfun(@std, data, 'InputVariables', {'tur', 'oppositional', 'inattentive', 'hyperactive', 'ADHDIndex'});


combinedcorr = [means_corr, std_corr];
combinedToR = [means_ToM, std_ToM];
combinedeyeandmouth = [means_eyeandmouth, std_eyeandmouth];
combinedtotals = [means_totals, std_totals];
combined_adhdsym = [means_adhdsym, std_adhdsym];

distributiontests = readtable('annette distribution tests.xlsx');

test1 = distributiontests(:,"oppositional");
test2 = distributiontests(:,"inattentive");
test3 = distributiontests(:,"A_PFMR_D");
test4 = distributiontests(:,"A_PFER_D");
test5 = distributiontests(:,"A_PFMR_F");
test6 = distributiontests(:,"A_PFER_F");
test7 = distributiontests(:,"A_PFMR_H");
test8 = distributiontests(:,"A_PFER_H");
test9 = distributiontests(:, "d_PFMR");
test10 = distributiontests(:, "d_PFER");
test11 = distributiontests(:, "f_PFMR");
test12 = distributiontests(:, "f_PFER");
test13 = distributiontests(:,"h_PFMR");
test14 = distributiontests(:,"h_PFER");
test15 = distributiontests(:,"dcorr_A");
test16 = distributiontests(:,"fcorr_A");
test17 = distributiontests(:,"hcorr_A");
test18 = distributiontests(:,"dcorr");
test19 = distributiontests(:,"fcorr");
test20 = distributiontests(:,"hcorr");

x = test20.hcorr;
h = kstest(x)





