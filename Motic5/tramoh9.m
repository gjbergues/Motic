function [fitresult, gof] = createFit(x, ch_d9x)
%CREATEFIT(X,CH_D9X)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: ch_d9x
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 26-Aug-2020 15:01:10


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, ch_d9x );

% Set up fittype and options.
ft = fittype( 'gauss4' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [255 45 3.26510010962701 255 5 6.7951917394726 251 84 3.99121143322714 60.9999999997458 63 3211.05094322965];
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% % Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'ch_d9x vs. x', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel( 'x' );
% ylabel( 'ch_d9x' );
% grid on

