function[H]= Transf(a,b,ciy,cix)
% a coeficientes de las derivadas de la salida menor a mayor [a_0, ..., a_n]
% b coeficientes de las derivadas de la entrada menor a mayor [b_0, ..., b_m]
% ciy condiciones iniciales de la salida de  menor a mayor [y(0), y(0)^(n-1)]
% cix condiciones iniciales de la entrada de menor a meyor [x(0), x^(m-1)(0)]

close all
tam=size(a);
tami=size(b);
syms y(t) Y(s) x(t) X(s) Yy fp;
syms edd edi 
edd=0;
edi=0;

for i=1:tam(2)
   edd=edd+a(i)*s^(i-1)*Y(s);
   for k=1:i-1
       edd=edd-a(i)*(s^(i-1-k)*ciy(k));
   end
end

for i=1:tami(2)
   edi=edi+b(i)*s^(i-1)*X(s);
   for k=1:i-1
       edi=edi-b(i)*(s^(i-1-k)*cix(k));
   end
end
disp('Transformada de Laplace:')
pretty(edd)
disp('=')
pretty(edi)
 % Factorizamos X(s)
  edi=collect(edi,X(s));
   % Factorizamos Y(s)
   edd=collect(edd,Y(s));
   disp('Factorizando X(s) y Y(s):')
   pretty(edd)
disp('=')
pretty(edi)
   % Dividimos entre Y(s) y X(s) para formar las funcies en funci�n de s
   edd=edd/Y(s);
   edi=edi/X(s);
   % Obtenemos la funci�n de transferencia
   disp('Obtenemos entonces la funci�n de Transferencia:')
   disp('H(s)=')
   
   H=edi/edd;
   pretty(H)
  
end

