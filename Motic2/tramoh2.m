function [fitresult, gof] = createFit(x, ch_d2x)
%CREATEFIT(X,CH_D2X)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: ch_d2x
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 10-Aug-2020 10:11:14


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, ch_d2x );

% Set up fittype and options.
ft = fittype( 'gauss4' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [244 48 3.21058834979893 233 88 5.58649035347016 220 9 5.09229547206288 59.9999994514031 63 292.236443689476];
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% % Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'ch_d2x vs. x', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel( 'x' );
% ylabel( 'ch_d2x' );
% grid on

