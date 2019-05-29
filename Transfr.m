function[H]=Transfr(a,b,ciy,cix)
% a coeficientes de las traslaciones de la salida mayor a menor [a_n, ..., a_0]
% b coeficientes de las traslaciones de la entrada mayor a menor [b_m, ..., b_0]
% ciy condiciones iniciales de la salida de mayor a menor [y(n-1), y(0)]
% cix condiciones iniciales de la entrada de mayor a menor [x(m-1), x(0)]
close all
tam=size(a);
tami=size(b);
syms y(n) n z Y(z) x(n) X(z) Yy fp;
syms edd edi
edd=0;
edi=0;

for i=1:tam(2)
   yd(i)=y(n+tam(2)-i);
   edd=edd+ a(i)*ztrans(yd(i));   
end


for i=1:tami(2)
   xd(i)=x(n+tami(2)-i);
   edi=edi+ b(i)*ztrans(xd(i));   
end

mensaje('Aplicamos Transformada Z ')
edd=subs(edd,ztrans(y(n),n,z), Y(z));
edi=subs(edi,ztrans(x(n),n,z), X(z));
pretty(edd)
disp('=')
pretty(edi)

%condiciones iniciales
for j=1:tami(2)-1
edi=subs(edi,x(tami(2)-1-j),cix(j));
end

for j=1:tam(2)-1
edd=subs(edd,y(tam(2)-1-j),ciy(j));
end

mensaje('Factorizamos Y(z) y X(z)')

edd=collect(edd,Y(z));
edi=collect(edi,X(z));
pretty(edd)
disp('=')
pretty(edi)

%division
edd=edd/Y(z);
edi=edi/X(z);

% Obtenemos la función de transferencia
   disp('Obtenemos entonces la función de Transferencia:')
   disp('H(z)=')
      H=edi/edd;
   pretty(H)
end


function mensaje(texto)
disp( ' ')
disp(texto)
disp( ' ')
end