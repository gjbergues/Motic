function [fitresult, gof] = createFit(x2, ch2)
%CREATEFIT(X2,CH2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x2
%      Y Output: ch2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 18-Feb-2020 09:38:39


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x2, ch2 );

% Set up fittype and options.
ft = fittype( 'gauss4' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [237 85 5.35160145192795 236 45 3.13440742835287 224 5 5.63499097321603 59.7473125060415 71 23.2778020459352];
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'ch2 vs. x2', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel( 'x2' );
% ylabel( 'ch2' );
% grid on


