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

%  Auto-generated by MATLAB on 14-Feb-2020 09:18:28


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( y, cv );

% Set up fittype and options.
ft = fittype( 'gauss4' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [231 51 3.3748756675817 231 11 6.1393487289763 226 91 4.72432833129627 61.9999999585789 67 18.260671696804];
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'cv vs. y', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel( 'y' );
% ylabel( 'cv' );
% grid on


