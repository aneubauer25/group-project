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

 combinedtable = [means_corr, std_corr];
combinedcorr = [means_corr, std_corr];
combinedeyeandmouth = [means_eyeandmouth, std_eyeandmouth];
combinedtotals = [means_totals, std_totals];

combined_adhdsym = [means_adhdsym, std_adhdsym];


