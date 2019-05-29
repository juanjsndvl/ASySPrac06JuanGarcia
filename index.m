%% P06: Sistemas Diferenciales y en Diferencias
%
% *UNIDAD PROFESIONAL INTERDISCIPLINARIA EN INGENIERÍA Y TECNOLOGÍAS AVANZADAS* 
% 
% *Análisis de Señales y Sistemas*
%
% Autor: García Sandoval Juan Jesús 2MV1
%
% Profesor: Dr Rafael Martínez Martínez
%
%% 1.1. Función de Transferencia
% Tenemos un sistema descrito por la función $y''+2y'+2y=x'+2x$ de la cual calcularemos la funciíon
% de transferencia: para esto hemos implementado la función _Transf_ la cual
% calcula la función de transferencia mediante la transformada de Laplace:
%%
% $$H(s)=\frac{P(s)}{Q(s)}$$ 
%%
% donde: 
%% 
% $P(s)=\sum_0^m b_i s^i$
%%
% y $Q(s)=\sum_0^n a_j s^j$
%
clear All
syms t
sympref('HeavisideAtOrigin', 1);
H=Transf([2 2 1],[2 1],[0 0],[0]);
%%
% El código de la función _Transf_ se encuentra en el siguiente <https://drive.google.com/file/d/1C9nhX9tC3g8b8iF7aYNbkIXtlkgUtqm7/view?usp=sharing enlace>
%% 1.2. Respuesta al impulso
%
% Por definición la respuesta al impulso es la transformada inversa a la
% función de transferencia, por lo tanto:
%
disp('y(t)=')
h(t)=ilaplace(H);
pretty(h(t))
t=0:0.01:10;
plot(t,h(t),'b','LineWidth',2)
hold on
plot(t,dirac(t),'r','LineWidth',2)
grid on
legend('Salida y(t)','Entrada x(t)=delta(t)','Location','Best')
%% 1.3. Respuesta a Entrada Cero
%
% Se ha implementado la función _laplace2016a_ para calcular la respuesta
% a entrada cero del sistema descrito por la función $y''+2y'+2y=x'+2x$ con
% condiciones iniciales $y(0)=1;y'(0)=1$
syms t
sympref('HeavisideAtOrigin', 1);
yxo(t)=laplace2016a([2 2 1],[2 1],[1 1],[0],heaviside(t)-heaviside(t),10);
%% 1.4. Respuesta a Estado Cero
%
% Se ha implementado la función _laplace2016a_ para calcular la respuesta
% a estado cero del sistema descrito por la función $y''+2y'+2y=x'+2x$ y
% entrada $x(t)=e^{-t}u(t)$
syms t
sympref('HeavisideAtOrigin', 1);
yyo(t)=laplace2016a([2 2 1],[2 1],[0 0],[1],exp(-t)*heaviside(t),10);
%% 1.5. Respuesta Total
%
% Se ha calculado la respuesta total del sistema descrito por la función
% $y''+2y'+2y=x'+2x$, condiciones iniciales $y(0)=1;y'(0)=1$ y 
% entrada $x(t)=e^{-t}u(t)$
close All
yt(t)=yxo(t)+yyo(t);
disp('yt(t)=')
pretty(yt(t))
t=0:0.01:10;
plot(t,yt(t),'b','LineWidth',2)
hold on
plot(t,exp(-t).*heaviside(t),'r','LineWidth',2)
hold on
plot(t,yxo(t),'g','LineWidth',2)
hold on
plot(t,yyo(t),'y','LineWidth',2)
grid on
legend('Respuesta Total','Entrada x(t)','Respuesta a Entrada Cero','Respuesta a Estado Cero','Location','Best')
%% 1.6. Respuesta al Escalón
%
% Se ha implementado la función _laplace2016a_ para calcular la respuesta
% del sistema descrito por la función $y''+2y'+2y=x'+2x$ y
% entrada $x(t)=u(t)$ y condiciones iniciales 0
syms t
sympref('HeavisideAtOrigin', 1);
yu(t)=laplace2016a([2 2 1],[2 1],[0 0],[1],heaviside(t),10);
%% 1.7. Subplot
%
% Se ha desarrollado una función llamada _FigContinua_ la cual muestra las
% gráficas anteriores en una sola ventana
%
syms t
FigContinua(10,dirac(t),h(t),'Respuesta al Impulso',heaviside(t)-heaviside(t),yxo(t),...
    'Respuesta a Entrada Cero',exp(-t)*heaviside(t),yyo(t),'Respuesta a Estado Cero',...
    exp(-t).*heaviside(t),yt(t),'Respuesta Total',heaviside(t),yu(t),'Respuesta al Escalón')
%%
% El código de la función _FigContinua_ se encuentra en siguiente <https://drive.google.com/file/d/18v2ed3VZlUOc8P5Kjte7O13vbWwhbuks/view?usp=sharing enlace>
%% 2.1. Función de Transferencia
% Tenemos un sistema descrito por la función $6y[n+2]+5y[n+1]+y[n]=x[n+1]+x[n]$ de la cual calcularemos la funciíon
% de transferencia: para esto hemos implementado la función _Transfr_ la cual
% calcula la función de transferencia mediante la transformada de Laplace:
%%
% $$H[z]=\frac{P[z]}{Q[z]}$$ 
%
clear All
close All
syms n
sympref('HeavisideAtOrigin', 1);
Transfr([1 5 6],[1 1],[0 0],[0])
%%
% El código de la función _Transfr_ se encuentra en el siguiente <https://drive.google.com/file/d/1DDLFi9qGj2R5orekHSQQlnU1kX9s5Rwj/view?usp=sharing enlace>
%% 2.2. Respuesta al impulso
%
% Por definición la respuesta al impulso es la transformada inversa a la
% función de transferencia, por lo tanto:
%
disp('y[n]=')
h(n)=iztrans(H);
pretty(h(n))
n=0:10;
stem(n,h(n),'b','LineWidth',2)
hold on
stem(0,1,'r','LineWidth',2)
grid on
legend('Salida y[n]','Entrada x[n]=KroneckerDelta[n]','Location','Best')
%% 2.3. Respuesta a Entrada Cero
%
% Se ha implementado la función _zeta2016a_ para calcular la respuesta
% a entrada cero del sistema descrito por la función $6y[n+2]+5y[n+1]+y[n]=x[n+1]+x[n]$ con
% condiciones iniciales $y(0)=1;y(1)=2$
syms n
sympref('HeavisideAtOrigin', 1);
yxo(n)=zeta2016a([1 5 6],[1 1],[1 2],[0],heaviside(n)-heaviside(n),10);
%% 2.4. Respuesta a Estado Cero
%
% Se ha implementado la función _zeta2016a_ para calcular la respuesta
% a estado cero del sistema descrito por la función $6y[n+2]+5y[n+1]+y[n]=x[n+1]+x[n]$ y
% entrada $x[n]=u[n]$
syms n
sympref('HeavisideAtOrigin', 1);
yyo(n)=zeta2016a([1 5 6],[1 1],[0 0],[0.5],heaviside(n),10);
%% 2.5. Respuesta Total
%
% Se ha calculado la respuesta total del sistema descrito por la función
% $6y[n+2]+5y[n+1]+y[n]=x[n+1]+x[n]$, condiciones iniciales $y(0)=1;y(1)=2$ y 
% entrada $x[n]=u[n]$
close All
yt(n)=yxo(n)+yyo(n);
disp('yt(n)=')
pretty(yt(n))
n=0:10;
stem(n,yt(n),'b','LineWidth',2)
hold on
stem(n,heaviside(n),'r','LineWidth',2)
grid on
legend('Respuesta Total','Entrada x[n]','Respuesta a Entrada Cero','Respuesta a Estado Cero','Location','Best')
%% 1.6. Respuesta al Escalón
%
% Se ha implementado la función _zeta2016a_ para calcular la respuesta
% del sistema descrito por la función $6y[n+2]+5y[n+1]+y[n]=x[n+1]+x[n]$ y
% entrada $x[n]=u[n]$ y condiciones iniciales 0
syms n
sympref('HeavisideAtOrigin', 1);
yu(n)=zeta2016a([1 5 6],[1 1],[0 0],[0.5],heaviside(n),10);
%% 2.7. Subplot
%
% Se ha desarrollado una función llamada _FigDis_ la cual muestra las
% gráficas anteriores en una sola ventana
%
syms n
sympref('HeavisideAtOrigin', 1);
FigDis(10,kroneckerDelta(n),h(n),'Respuesta al Impulso',heaviside(n)-heaviside(n),yxo(n),...
    'Respuesta a Entrada Cero',heaviside(n),yyo(n),'Respuesta a Estado Cero',heaviside(n),yt(n),...
    'Respuesta Total',heaviside(n),yu(n),'Respuesta al Escalón')
%%
% El código de la función _FigContinua_ se encuentra en el siguiente <https://drive.google.com/file/d/1E4HeRHVEFMht-D8QAEG1Ps-3knMZeTXN/view?usp=sharing enlace>
%% Referencias
% 
% # B.P. Lathi. (2005). Linear Systems and Signals. New York: Oxford University Press, Inc.
% # (2012). Juntas, pero no revueltas: sub-gráficas en una misma figura de Matlab . 26 mayo 2019, de 5 minutos de Matlab Sitio web: http://5minutosdematlab.blogspot.com/2012/09/juntas-pero-no-revueltas-sub-graficas.html
%

