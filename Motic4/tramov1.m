function [fitresult, gof] = createFit(y, cv)
%CREATEFIT(Y,CV)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : y
%      Y Output: cv
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 21-Aug-2020 09:04:27


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( y, cv );

% Set up fittype and options.
ft = fittype( 'gauss4' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [217 8 5.57627469013761 203 48 3.50125456168469 198 88 4.72559287136402 61.9999978302894 63 23.0067786752432];
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% % Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'cv vs. y', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel( 'y' );
% ylabel( 'cv' );
% grid on


