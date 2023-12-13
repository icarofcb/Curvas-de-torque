
pkg load io;
pkg load control;
pkg load statistics;
clc,clear, close all.

%Plote o conjugado eletromagnetico Tmec em função da velocidade do motor em rpm
%Tmec=(3*i2^2*R2/s)/ws
%ws=4*pi*F/P
%Ns=120*F/P
%N=(1-s)*Ns
clc
clear
F=60;
R1=0.294;
L1=0.503/(2*pi*60);
R2=0.144;
L2=0.209/(2*pi*60);
Lm=13.25/(2*pi*60);
P=6;
%Laço da Frequência e Tensão
for m=1:10
    if m==1
       F=60;
       X1 = 2*pi*F*L1;
       X2 = 2*pi*F*L2;
       Xm = 2*pi*F*Lm;
       V=(220/sqrt(3));
    elseif m==2
        F=60*0.90;
        X1 = 2*pi*F*L1;
        X2 = 2*pi*F*L2;
        Xm = 2*pi*F*Lm;
        V=(220/sqrt(3))*0.92;
    elseif m==3
        F=60*0.80;
        X1 = 2*pi*F*L1;
        X2 = 2*pi*F*L2;
        Xm = 2*pi*F*Lm;
        V=(220/sqrt(3))*0.84;
    elseif m==4
        F=60*0.70;
        X1 = 2*pi*F*L1;
        X2 = 2*pi*F*L2;
        Xm = 2*pi*F*Lm;
        V=(220/sqrt(3))*0.76;
    elseif m==5
        F=60*0.60;
        X1 = 2*pi*F*L1;
        X2 = 2*pi*F*L2;
        Xm = 2*pi*F*Lm;
        V=(220/sqrt(3))*0.68;
    elseif m==6
        F=60*1.10;
        X1 = 2*pi*F*L1;
        X2 = 2*pi*F*L2;
        Xm = 2*pi*F*Lm;
        V=(220/sqrt(3));
    elseif m==7
        F=60*1.20;
        X1 = 2*pi*F*L1;
        X2 = 2*pi*F*L2;
        Xm = 2*pi*F*Lm;
        V=(220/sqrt(3));
    elseif m==8
        F=60*1.30;
        X1 = 2*pi*F*L1;
        X2 = 2*pi*F*L2;
        Xm = 2*pi*F*Lm;
        V=(220/sqrt(3));
    elseif m==9
        F=60*1.40;
        X1 = 2*pi*F*L1;
        X2 = 2*pi*F*L2;
        Xm = 2*pi*F*Lm;
        V=(220/sqrt(3));
    else
        F=60*1.50;
        X1 = 2*pi*F*L1;
        X2 = 2*pi*F*L2;
        Xm = 2*pi*F*Lm;
        V=(220/sqrt(3));
    end    
        
Z1=R1+j*X1;
Zm=j*Xm;    
Ns=120*F/P;
Ws=4*pi*F/P;

%Equivalente de Thévenin
Vth=Zm*V/(Z1+Zm);
Zth=(Zm*Z1)/(Zm+Z1);
Rth=real(Zth);
Xth=imag(Zth);

%Laço do escorregamento
s=eps:0.001:1;
for k=1:length(s)   
    I2(k)=abs(Vth)/(sqrt((Rth+R2/s(k))^2+(Xth+X2)^2));
    N(k)=(1-s(k))*Ns;
    Tmec(k)=(3*I2(k)*I2(k)*R2/s(k))/Ws;
end
plot (N,Tmec),grid
if m==1
    hold
end
end
hold