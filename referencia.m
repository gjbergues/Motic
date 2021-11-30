function [fitresult, gof] = createFit(x, ch)
%CREATEFIT(X,CH)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: ch
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 13-Feb-2020 10:27:39


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, ch );

% Set up fittype and options.
ft = fittype( 'gauss4' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [226 403 21.0217331236719 226 5 22.6408757044208 60.9999999997098 293 214.835317902809 40.6208779502448 58 19.6302308807762];
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );



