%Read the image and transform gray
frame = imread('Motic2.bmp'); 
I = (.2989*frame(:,:,1) + .5870*frame(:,:,2) + .1140*frame(:,:,3));

%Rotate image for aligment
J = imrotate(I,0.4,'bilinear');
%Save image
Folder = 'C:\Users\Bergues\Dropbox\Matlab softwares\Retícula óptica';
File   = 'Motic2_gray.bmp';
imwrite(J, fullfile(Folder, File));
% imshow(File)

%Obtain the calibration distance from scale
y_ref = 962;%cut position in y
x_ref = 1:420;%long vector for the cut
Ic_ref = imcrop(J, [10 960 419 49]);%[xmin ymin width height]%image cut
ch_ref = squeeze(Ic_ref(10,:));%corte horizontal
imshow(Ic_ref)

%funcion referencia para fiteo de las gaussianas
[fith_ref] = referencia(x_ref, ch_ref);

%obtengo los coeficientes de las gaussianas de referencia
c_ref = coeffvalues(fith_ref);
c_refm = reshape(c_ref, 3, 4);%matrix de coeficientes
b_ref = sort(c_refm(2,:));%centros de las gaussianas
gmin = min(b_ref);        
gmax = max(b_ref);
esc = gmax - gmin;
ref = 500;
rp = ref/esc;%um por pixel
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% ANÁLISIS HORIZONTAL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%This data is the same for the horizontal cuts
ancho = 99;
alto = 70;
x = 1:100;
ymin = 494;

%%%%%%%%%%%%%%%%%%%%%%%% d1x %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 111;


%corte de la imagen
Ic_d1x = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
ch_d1x = squeeze(Ic_d1x(45,:));%cortes horizontales
[fith_d1x] = tramoh1(x, ch_d1x);
% obtengo los coeficientes de las gaussianas
c_d1x = coeffvalues(fith_d1x);
c_d1x = reshape(c_d1x, 3, 4);%fila1=intensidad; fila2=posición gaussiana; fila3=ancho gaussiana
b_d1x = sort(c_d1x(2,:));%busca los elementos de la fila 2 y los coloca en orden ascendente
sig_d1x = sort(c_d1x(3,:));%desviaciones estándar

%desviaciones estándar
sig_ex1 = sig_d1x(1);
sig_ex2 = sig_d1x(2);
sig_ex3 = sig_d1x(3);

%pixel positions
ex1 = b_d1x(1);
ex2 = b_d1x(2);
ex3 = b_d1x(3);
%%%%%%%%%%%%%%%%%%%%%%%% d2x %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 191;%+80

%corte de la imagen
Ic_d2x = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
ch_d2x = squeeze(Ic_d2x(45,:));%cortes horizontales
[fith_d2x] = tramoh2(x, ch_d2x);
% obtengo los coeficientes de las gaussianas
c_d2x = coeffvalues(fith_d2x);
c_d2x = reshape(c_d2x, 3, 4);
b_d2x = sort(c_d2x(2,:));
sig_d2x = sort(c_d2x(3,:));

dist1 = b_d2x(2) - b_d2x(1);
dist2 = b_d2x(4) - b_d2x(2);

%desviaciones estándar
sig_ex4 = sig_d2x(2);
sig_ex5 = sig_d2x(3);

%pixel positions
ex4 = ex3 + dist1;
ex5 = ex3 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d3x %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 271;%+80

%corte de la imagen
Ic_d3x = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
ch_d3x = squeeze(Ic_d3x(45,:));%cortes horizontales
[fith_d3x] = tramoh3(x, ch_d3x);
% obtengo los coeficientes de las gaussianas
c_d3x = coeffvalues(fith_d3x);
c_d3x = reshape(c_d3x, 3, 4);
b_d3x = sort(c_d3x(2,:));
sig_d3x = sort(c_d3x(3,:));

dist1 = b_d3x(2) - b_d3x(1);
dist2 = b_d3x(4) - b_d3x(2);

%desviaciones estándar
sig_ex6 = sig_d3x(2);
sig_ex7 = sig_d3x(3);

%pixel positions
ex6 = ex5 + dist1;
ex7 = ex5 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d4x %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 351;%+80

%corte de la imagen
Ic_d4x = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
ch_d4x = squeeze(Ic_d4x(46,:));%cortes horizontales
[fith_d4x] = tramoh4(x, ch_d4x);
% obtengo los coeficientes de las gaussianas
c_d4x = coeffvalues(fith_d4x);
c_d4x = reshape(c_d4x, 3, 4);
b_d4x = sort(c_d4x(2,:));
sig_d4x = sort(c_d4x(3,:));

dist1 = b_d4x(3) - b_d4x(2);
dist2 = b_d4x(4) - b_d4x(3);

%desviaciones estándar
sig_ex8 = sig_d4x(3);
sig_ex9 = sig_d4x(1);

%pixel positions
ex8 = ex7 + dist1;
ex9 = ex7 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d5x %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 431;%+80
%ymin = 494;
ymin = 499;


%corte de la imagen
ic_d5x = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
ch_d5x = squeeze(ic_d5x(41,:));%cortes horizontales
[fith_d5x] = tramoh5(x, ch_d5x);
% obtengo los coeficientes de las gaussianas
c_d5x = coeffvalues(fith_d5x);
c_d5x = reshape(c_d5x, 3, 4);
b_d5x = sort(c_d5x(2,:));
sig_d5x = sort(c_d5x(3,:));

dist1 = b_d5x(2) - b_d5x(1);
dist2 = b_d5x(3) - b_d5x(2);

%desviaciones estándar
sig_ex10 = sig_d5x(2);
sig_ex11 = sig_d5x(3);

%pixel positions
ex10 = ex9 + dist1;
ex11 = ex9 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d6x %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 511;%+80

%corte de la imagen
Ic_d6x = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
ch_d6x = squeeze(Ic_d6x(41,:));%cortes horizontales
[fith_d6x] = tramoh6(x, ch_d6x);
% obtengo los coeficientes de las gaussianas
c_d6x = coeffvalues(fith_d6x);
c_d6x = reshape(c_d6x, 3, 4);
b_d6x = sort(c_d6x(2,:));
sig_d6x = sort(c_d6x(3,:));

dist1 = b_d6x(2) - b_d6x(1);
dist2 = b_d6x(3) - b_d6x(2);

%desviaciones estándar
sig_ex12 = sig_d6x(2);
sig_ex13 = sig_d6x(3);

%pixel positions
ex12 = ex11 + dist1;
ex13 = ex11 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d7x %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 590;%+80
ymin = 498;

%corte de la imagen
Ic_d7x = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
ch_d7x = squeeze(Ic_d7x(41,:));%cortes horizontales
[fith_d7x] = tramoh7(x, ch_d7x);
% obtengo los coeficientes de las gaussianas
c_d7x = coeffvalues(fith_d7x);
c_d7x = reshape(c_d7x, 3, 4);
b_d7x = sort(c_d7x(2,:));
sig_d7x = sort(c_d7x(3,:));

dist1 = b_d7x(2) - b_d7x(1);
dist2 = b_d7x(4) - b_d7x(2);

%desviaciones estándar
sig_ex14 = sig_d7x(2);
sig_ex15 = sig_d7x(3);


%pixel positions
ex14 = ex13 + dist1;
ex15 = ex13 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d8x %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 670;%+80

%corte de la imagen
Ic_d8x = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
ch_d8x = squeeze(Ic_d8x(41,:));%cortes horizontales
[fith_d8x] = tramoh8(x, ch_d8x);
% obtengo los coeficientes de las gaussianas
c_d8x = coeffvalues(fith_d8x);
c_d8x = reshape(c_d8x, 3, 4);
b_d8x = sort(c_d8x(2,:));
sig_d8x = sort(c_d8x(3,:));

dist1 = b_d8x(3) - b_d8x(2);
dist2 = b_d8x(4) - b_d8x(3);

%desviaciones estándar
sig_ex16 = sig_d8x(2);
sig_ex17 = sig_d8x(3);

%pixel positions
ex16 = ex15 + dist1;
ex17 = ex15 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d9x %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 750;%+80

%corte de la imagen
Ic_d9x = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
ch_d9x = squeeze(Ic_d9x(41,:));%cortes horizontales
[fith_d9x] = tramoh9(x, ch_d9x);
% obtengo los coeficientes de las gaussianas
c_d9x = coeffvalues(fith_d9x);
c_d9x = reshape(c_d9x, 3, 4);
b_d9x = sort(c_d9x(2,:));
sig_d9x = sort(c_d9x(3,:));

dist1 = b_d9x(3) - b_d9x(2);
dist2 = b_d9x(4) - b_d9x(3);

%desviaciones estándar
sig_ex18 = sig_d9x(2);
sig_ex19 = sig_d9x(3);

%pixel positions
ex18 = ex17 + dist1;
ex19 = ex17 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d10x %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 831;%+80

%corte de la imagen
Ic_d10x = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
ch_d10x = squeeze(Ic_d10x(41,:));%cortes horizontales
[fith_d10x] = tramoh10(x, ch_d10x);
% obtengo los coeficientes de las gaussianas
c_d10x = coeffvalues(fith_d10x);
c_d10x = reshape(c_d10x, 3, 4);
b_d10x = sort(c_d10x(2,:));
sig_d10x = sort(c_d10x(3,:));

dist1 = b_d10x(3) - b_d10x(2);
dist2 = b_d10x(4) - b_d10x(3);

%desviaciones estándar
sig_ex10 = sig_d10x(2);
sig_ex21 = sig_d10x(3);

%pixel positions
ex20 = ex19 + dist1;
ex21 = ex19 + dist1 + dist2;


%vector horizontal
vex = [ex1, ex2, ex3, ex4, ex5, ex6, ex7, ex8, ex9, ex10, ex11, ex12, ex13, ex14, ex15, ex16, ex17, ex18, ex19, ex20, ex21];%ex11 center position
vex1= vex - ex1;%ex1=0
Lx_px= ex21 - ex1;
Lx_um = rp*Lx_px;
vex2 = vex1 - vex1(11);%ex11=0
ejex_px = vex2;%eje x en pixeles
ejex_um = rp*vex2;%eje x transformado por escala

Vx_m1= ejex_px(1:11);%eje -x
Vx_m2= ejex_px(11:21);%eje +x

pv1 = 1:21;%long position vector
pv2 = 1:11;%short position vector

plot(ejex_px, 'b--o')
title('Eje X en pixeles');
xlabel('Posición');
ylabel('Distancia (px)');

fh = LinearModel.fit(pv2, Vx_m1); 
figure; plot(fh)
title('Regresión lineal 1 mitad X');
xlabel('Posición');
ylabel('Distancia');

resfh = fh.Residuals.Raw;
figure; plot(pv2, resfh, '*r')
%h = plotResiduals(fh,'fitted');
title('Residuos 1 mitad X');
xlabel('Posición');
ylabel('Residuos');  

sh = LinearModel.fit(pv2, Vx_m2); 
figure; plot(sh)
title('Regresión lineal 2 mitad X');
xlabel('Posición');
ylabel('Distancia');

ressh = sh.Residuals.Raw;
figure; plot(pv2, ressh, '*b')
%h = plotResiduals(sh,'fitted');
title('Residuos 2 mitad X');
xlabel('Posición');
ylabel('Residuos'); 


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%% ANÁLISIS VERTICAL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%% d1y %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 536;
ymin = 110;
ancho = 49;
alto = 99;
y = 1:100;
%corte de la imagen
Ic = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
cv = squeeze(Ic(:,4));%cortes horizontales
[fith, gofh] = tramov1(y, cv);
% obtengo los coeficientes de las gaussianas
cesc1 = coeffvalues(fith);
besc1 = reshape(cesc1, 3, 4);
b_esc1 = sort(besc1(2,:));
Besc1 = b_esc1'; 
dist1 = Besc1(2) - Besc1(1);
dist2 = Besc1(3) - Besc1(2);

%Distance in um
dv1 = rp*dist1;
dv2 = rp*dist2;
DTV1 = dv1 + dv2;

%pixel positions
ey1 = Besc1(1);
ey2 = Besc1(2);
ey3 = Besc1(3);
%%%%%%%%%%%%%%%%%%%%%%%% d2y %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 536;
ymin = 190;% +80 px

%corte de la imagen
Ic = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
cv = squeeze(Ic(:,4));%cortes horizontales
[fith, gofh] = tramov2(y, cv);
% obtengo los coeficientes de las gaussianas
cesc1 = coeffvalues(fith);
besc1 = reshape(cesc1, 3, 4);
b_esc1 = sort(besc1(2,:));
Besc1 = b_esc1';
dist1 = Besc1(2) - Besc1(1);
dist2 = Besc1(4) - Besc1(2);
 
%Distance in um
dv3 = rp*dist1;
dv4 = rp*dist2;
DTV2 = dv3 + dv4;

%pixel positions
ey4 = ey3 + dist1;
ey5 = ey3 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d3y %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 535;
ymin = 270;%+ 80 px

%corte de la imagen
Ic = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
cv = squeeze(Ic(:,3));%cortes horizontales
[fith, gofh] = tramov3(y, cv);
% obtengo los coeficientes de las gaussianas
cesc1 = coeffvalues(fith);
besc1 = reshape(cesc1, 3, 4);
b_esc1 = sort(besc1(2,:));
Besc1 = b_esc1';
dist1 = Besc1(3) - Besc1(2);
dist2 = Besc1(4) - Besc1(3);

%Distance in um
dv5 = rp*dist1;
dv6 = rp*dist2;
DTV3 = dv5 + dv6;

%pixel positions
ey6 = ey5 + dist1;
ey7 = ey5 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d4y %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin= 536;
ymin = 350;%+80 px

%corte de la imagen
Ic = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
cv = squeeze(Ic(:,5));%cortes horizontales
[fith, gofh] = tramov4(y, cv);
% obtengo los coeficientes de las gaussianas
cesc1 = coeffvalues(fith);
besc1 = reshape(cesc1, 3, 4);
b_esc1 = sort(besc1(2,:));
Besc1 = b_esc1';
dist1 = Besc1(3) - Besc1(2);
dist2 = Besc1(4) - Besc1(3);
 
%Distance in um
dv7 = rp*dist1;
dv8 = rp*dist2;
DTV4 = dv7 + dv8;

%pixel positions
ey8 = ey7 + dist1;
ey9 = ey7 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d5y %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 536;
ymin = 430;%+80 px

%corte de la imagen
Ic = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
cv = squeeze(Ic(:,10));%cortes horizontales
[fith, gofh] = tramov5(y, cv);
% obtengo los coeficientes de las gaussianas
cesc1 = coeffvalues(fith);
besc1 = reshape(cesc1, 3, 4);
b_esc1 = sort(besc1(2,:));
Besc1 = b_esc1';
dist1 = Besc1(2) - Besc1(1);
dist2 = Besc1(3) - Besc1(2);
 
%Distance in um
dv9 = rp*dist1;
dv10 = rp*dist2;
DTV5 = dv9 + dv10;

%pixel positions
ey10 = ey9 + dist1;
ey11 = ey9 + dist1 + dist2;
% %%%%%%%%%%%%%%%%%%%%%%%% d6y %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin= 535;
ymin = 509;%+80 px

%corte de la imagen
Ic = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
cv = squeeze(Ic(:,10));%cortes horizontales
[fith, gofh] = tramov6(y, cv);
% obtengo los coeficientes de las gaussianas
cesc1 = coeffvalues(fith);
besc1 = reshape(cesc1, 3, 4);
b_esc1 = sort(besc1(2,:));
Besc1 = b_esc1';
dist1 = Besc1(2) - Besc1(1);
dist2 = Besc1(3) - Besc1(2);
 
%Distance in um
dv11 = rp*dist1;
dv12 = rp*dist2;
DTV6 = dv11 + dv12;

%pixel positions
ey12 = ey11 + dist1;
ey13 = ey11 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d7y %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin= 536;
ymin=590; %+80 px

%corte de la imagen
Ic = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
cv = squeeze(Ic(:,5));%cortes horizontales
[fith, gofh] = tramov7(y, cv);
% obtengo los coeficientes de las gaussianas
cesc1 = coeffvalues(fith);
besc1 = reshape(cesc1, 3, 4);
b_esc1 = sort(besc1(2,:));
Besc1 = b_esc1';
dist1 = Besc1(2) - Besc1(1);
dist2 = Besc1(3) - Besc1(2);
 
%Distance in um
dv13 = rp*dist1;
dv14 = rp*dist2;
DTV7 = dv13 + dv14;

%pixel positions
ey14 = ey13 + dist1;
ey15 = ey13 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d8y %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 536;
ymin = 670; %+80 px

%corte de la imagen
Ic = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
cv = squeeze(Ic(:,5));%cortes horizontales
[fith, gofh] = tramov8(y, cv);
% obtengo los coeficientes de las gaussianas
cesc1 = coeffvalues(fith);
besc1 = reshape(cesc1, 3, 4);
b_esc1 = sort(besc1(2,:));
Besc1 = b_esc1';
dist1 = Besc1(2) - Besc1(1);
dist2 = Besc1(3) - Besc1(2);
 
%Distance in um
dv15 = rp*dist1;
dv16 = rp*dist2;
DTV8 = dv15 + dv16;

%pixel positions
ey16 = ey15 + dist1;
ey17 = ey15 + dist1 + dist2;
%%%%%%%%%%%%%%%%%%%%%%%% d9y %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin = 536;
ymin = 750;%+80 px

%corte de la imagen
Ic = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
cv = squeeze(Ic(:,5));%cortes horizontales
[fith, gofh] = tramov9(y, cv);
% obtengo los coeficientes de las gaussianas
cesc1 = coeffvalues(fith);
besc1 = reshape(cesc1, 3, 4);
b_esc1 = sort(besc1(2,:));
Besc1 = b_esc1';
dist1 = Besc1(3) - Besc1(2);
dist2 = Besc1(4) - Besc1(3);
 
%Distance in um
dv17 = rp*dist1;
dv18 = rp*dist2;
DTV9 = dv17 + dv18;

%pixel positions
ey18 = ey17 + dist1;
ey19 = ey17 + dist1 + dist2;
% %%%%%%%%%%%%%%%%%%%%%%%% d10y %%%%%%%%%%%%%%%%%%%%%%%%%%%%
xmin= 535;
ymin=829;%+80 px

%corte de la imagen
Ic = imcrop(J, [xmin ymin ancho alto]);%[xmin ymin width height]%
cv = squeeze(Ic(:,2));%cortes horizontales
[fith, gofh] = tramov10(y, cv);
% obtengo los coeficientes de las gaussianas
cesc1 = coeffvalues(fith);
besc1 = reshape(cesc1, 3, 4);
b_esc1 = sort(besc1(2,:));
Besc1 = b_esc1';
dist1 = Besc1(3) - Besc1(2);
dist2 = Besc1(4) - Besc1(3);
 
%Distance in um
dv19 = rp*dist1;
dv20 = rp*dist2;
DTV9 = dv19 + dv20;


%pixel positions
ey20 = ey19 + dist1;
ey21 = ey19 + dist1 + dist2;


%vector horizontal y
vey = [ey1, ey2, ey3, ey4, ey5, ey6, ey7, ey8, ey9, ey10, ey11, ey12, ey13, ey14, ey15, ey16, ey17, ey18, ey19, ey20, ey21];%ex11 center position
vey1= vey - ey1;%ex1=0
Ly_px = ey21 - ey1;
Ly_um = rp*Ly_px;
vey2 = vey1-vey1(11);%ex11=0
ejey_px = vey2;%eje x en pixeles
ejey_um = rp*vey2;%eje x transformado por escala

Vy_m1= ejey_px(1:11);%eje -y
Vy_m2= ejey_px(11:21);%eje +y

ph1 = 1:21;%long position vector
ph2 = 1:11;%short position vector

figure; plot(ejey_px, 'b--o')
title('Eje Y en pixeles');
xlabel('Posición');
ylabel('Distancia (px)');

fv = LinearModel.fit(ph2, Vy_m1); 
figure; plot(fv)
title('Regresión lineal 1 mitad Y');
xlabel('Posición');
ylabel('Distancia');

resfv = fv.Residuals.Raw;
figure; plot(ph2, resfv, '*r')
%h = plotResiduals(fv,'fitted');
title('Residuos 1 mitad Y');
xlabel('Posición');
ylabel('Residuos');  

sv = LinearModel.fit(ph2, Vy_m2); 
figure; plot(sv)
title('Regresión lineal 2 mitad Y');
xlabel('Posición');
ylabel('Distancia');

ressv = sv.Residuals.Raw;
figure; plot(ph2, ressv, '*b')
%h = plotResiduals(sv,'fitted');
title('Residuos 2 mitad Y');
xlabel('Posición');
ylabel('Residuos'); 

%write vectors in pixeles on Excel
xlswrite('medidas.xlsx', {'''EjeX (px)'}, 1,'A1'); 
xlswrite('medidas.xlsx', {'''EjeY (px)'}, 1,'B1'); 
xlswrite('medidas.xlsx', ejex_px', 1,'A2'); 
xlswrite('medidas.xlsx', ejey_px', 1,'B2'); 

%write vectors in pixeles on Excel
xlswrite('medidas.xlsx', {'''EjeX (um)'}, 1,'C1'); 
xlswrite('medidas.xlsx', {'''EjeY (um)'}, 1,'D1'); 
xlswrite('medidas.xlsx', ejex_um', 1,'C2'); 
xlswrite('medidas.xlsx', ejey_um', 1,'D2');

%Longitud ejes en pixeles
xlswrite('medidas.xlsx', {'''Long X (px)'}, 1,'E1'); 
xlswrite('medidas.xlsx', {'''Long Y (px)'}, 1,'F1'); 
xlswrite('medidas.xlsx', Lx_px, 1,'E2'); 
xlswrite('medidas.xlsx', Ly_px, 1,'F2');

%Longitud ejes en um
xlswrite('medidas.xlsx', {'''Long X (um)'}, 1,'E4'); 
xlswrite('medidas.xlsx', {'''Long Y (um)'}, 1,'F4'); 
xlswrite('medidas.xlsx', Lx_um, 1,'E5'); 
xlswrite('medidas.xlsx', Ly_um, 1,'F5');
