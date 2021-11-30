function [fitresult, gof] = createFit(x, ch_d5x)
%CREATEFIT(X,CH_D5X)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: ch_d5x
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 26-Aug-2020 15:42:53


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, ch_d5x );

% Set up fittype and options.
ft = fittype( 'gauss4' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [255 87 4.58091713919837 255 47 2.98506806556181 255 8 5.20854793248959 60.9999999996089 63 2488.32578233816];
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% % Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'ch_d5x vs. x', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel( 'x' );
% ylabel( 'ch_d5x' );
% grid on


