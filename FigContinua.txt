function FigContinua(t0,Y1,Y11,Tit1,Y2,Y22,Tit2,Y3,Y33,Tit3,Y4,Y44,Tit4,Y5,Y55,Tit5)
t=0:0.01:t0;
subplot(3,2,1)
fplot(Y1,[0, t0],'r','LineWidth',2)
hold on
fplot(Y11,[0, t0],'b','LineWidth',2)
ax.XAxisLocation = 'origin'; 
ax.YAxisLocation = 'origin';
grid on
title(Tit1)
legend('entrada x(t)','salida y(t)','Location','Best')

subplot(3,2,2)
fplot(Y2,[0, t0],'r','LineWidth',2)
hold on
fplot(Y22,[0, t0],'b','LineWidth',2)
ax.XAxisLocation = 'origin'; 
ax.YAxisLocation = 'origin';
grid on
title(Tit2)
legend('entrada x(t)','salida y(t)','Location','Best')

subplot(3,2,3)
fplot(Y3,[0, t0],'r','LineWidth',2)
hold on
fplot(Y33,[0, t0],'b','LineWidth',2)
ax.XAxisLocation = 'origin'; 
ax.YAxisLocation = 'origin';
grid on
title(Tit3)
legend('entrada x(t)','salida y(t)','Location','Best')

subplot(3,2,4)
fplot(Y4,[0, t0],'r','LineWidth',2)
hold on
fplot(Y44,[0, t0],'b','LineWidth',2)
ax.XAxisLocation = 'origin'; 
ax.YAxisLocation = 'origin';
grid on
title(Tit4)
legend('entrada x(t)','salida y(t)','Location','Best')

subplot(3,2,5)
fplot(Y5,[0, t0],'r','LineWidth',2)
hold on
fplot(Y55,[0, t0],'b','LineWidth',2)
ax.XAxisLocation = 'origin'; 
ax.YAxisLocation = 'origin';
grid on
title(Tit5)
legend('entrada x(t)','salida y(t)','Location','Best')
end