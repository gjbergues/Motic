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

%  Auto-generated by MATLAB on 18-Feb-2020 09:41:06


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x2, ch2 );

% Set up fittype and options.
ft = fittype( 'gauss4' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [239 45 3.56829479577036 237 5 6.30565883953798 216 85 4.31467216559872 57.9999999667093 62 551.237174546055];
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


