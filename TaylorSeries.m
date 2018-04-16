clc
clear
%Ryan Pfannenstiel- 2.7.18
%The Purpose of this script is to find the Taylor series expansion of
%f(x)to the third order and find the true realtive percent error of each
%aproxximation
%%declare Varialbes
t=f(3);%truevalue
h=2;%Stepsize
Tseries=[];% array if taylor series orders
trperror=[];
%%calculate zeroth order
Tseries(1)=f(1);
%%calculate 1st order
Tseries(2)=f(1)+ff(1)*h;
%%calculate 2nd order
Tseries(3)=f(1)+ff(1)*h+(fff(1)/2)*h^2;
%%calculate 3rd order
Tseries(4)=f(1)+ff(1)*h+(fff(1)/2)*h^2+(ffff(1)/factorial(3))*h^3;
%%calculate array with realtive error
trperror=((t-abs(Tseries))./t)*100;
%declare functions
function y = f(x)
y=25*x^3+-6*x^2+7*x-88;
end

function firstD = ff(x)
firstD=75*x^2-12*x+7;
end

function secD = fff(x)
secD = 150*x-12;
end

function thirdD = ffff(x)
thirdD = 150;
end