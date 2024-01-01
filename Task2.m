% A. Loading fisherirsh 
load fisheriris.mat

% B. N - the total number of rows (objects, cases) in your data.
N = size(meas, 1);
fprintf('Total number of Rows : %d \n', N);


% C. Calculating and Report Statistics for each Columns from 1 to 4 
for i=1:4

    % Mean  value 
    mean_value = mean(meas(:,i));

    % Standard diviation value 
    std_valu = std(meas(:,i));

    % Min value 
    min_value = min(meas(:,i));

    %Max Value
    max_value = max(meas(:,i));

    % Root mean square 
    rsm_value = rms(meas(:,i));



% Displaying Features 
    fprintf('\n');
    fprintf('%d \n',i);
    fprintf('mean value = %.4f \n',mean_value);
    fprintf('Standard Diviation Value = %.4f \n',std_valu);
    fprintf('Minimum Value  = %.4f \n',min_value);
    fprintf('maximun Value = %.4f \n',max_value);
    fprintf('Root Mean Square = %.4f \n',rsm_value);
end









