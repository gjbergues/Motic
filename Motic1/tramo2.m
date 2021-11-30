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

%  Auto-generated by MATLAB on 18-Feb-2020 09:17:01


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x2, ch2 );

% Set up fittype and options.
ft = fittype( 'gauss4' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [252 88 4.73973769370106 227 48 3.40079060851063 221 9 5.16647310718377 58.8569754780493 23 27.6880077426387];
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


