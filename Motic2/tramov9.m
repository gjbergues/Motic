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

%  Auto-generated by MATLAB on 12-Aug-2020 15:06:43


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( y, cv );

% Set up fittype and options.
ft = fittype( 'gauss4' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [226 10 5.46833872526522 215 50 3.45804067954676 209 90 4.86818437388009 60.9999989176765 34 62.8133441136975];
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


