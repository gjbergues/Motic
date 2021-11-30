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

%  Auto-generated by MATLAB on 12-Aug-2020 15:05:22


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( y, cv );

% Set up fittype and options.
ft = fittype( 'gauss4' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [231 50 3.34742579334306 231 10 6.19574854537029 226 90 4.58422126064966 60.9999941517486 64 842.105245299346];
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


