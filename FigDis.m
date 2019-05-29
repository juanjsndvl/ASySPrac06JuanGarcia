function FigDis(t0,Y1,Y11,Tit1,Y2,Y22,Tit2,Y3,Y33,Tit3,Y4,Y44,Tit4,Y5,Y55,Tit5)
syms n
tiempo=0:1:t0;
subplot(3,2,1)
stem(tiempo,subs(Y1,n,tiempo),'r','LineWidth',2)
hold on
stem(tiempo,subs(Y11,n,tiempo),'b','LineWidth',2)
ax.XAxisLocation = 'origin'; 
ax.YAxisLocation = 'origin';
grid on
title(Tit1)
legend('entrada x[n]','salida [n]','Location','Best')

subplot(3,2,2)
stem(tiempo,subs(Y2,n,tiempo),'r','LineWidth',2)
hold on
stem(tiempo,subs(Y22,n,tiempo),'b','LineWidth',2)
ax.XAxisLocation = 'origin'; 
ax.YAxisLocation = 'origin';
grid on
title(Tit2)
legend('entrada x[n]','salida [n]','Location','Best')

subplot(3,2,3)
stem(tiempo,subs(Y3,n,tiempo),'r','LineWidth',2)
hold on
stem(tiempo,subs(Y33,n,tiempo),'b','LineWidth',2)
ax.XAxisLocation = 'origin'; 
ax.YAxisLocation = 'origin';
grid on
title(Tit3)
legend('entrada x[n]','salida [n]','Location','Best')

subplot(3,2,4)
stem(tiempo,subs(Y4,n,tiempo),'r','LineWidth',2)
hold on
stem(tiempo,subs(Y44,n,tiempo),'b','LineWidth',2)
ax.XAxisLocation = 'origin'; 
ax.YAxisLocation = 'origin';
grid on
title(Tit4)
legend('entrada x[n]','salida [n]','Location','Best')

subplot(3,2,5)
stem(tiempo,subs(Y5,n,tiempo),'r','LineWidth',2)
hold on
stem(tiempo,subs(Y55,n,tiempo),'b','LineWidth',2)
ax.XAxisLocation = 'origin'; 
ax.YAxisLocation = 'origin';
grid on
title(Tit5)
legend('entrada x[n]','salida [n]','Location','Best')
end