function [root]=NR(f,xi,maxiter,es)
%the purpose of this function is to find a root using the newton raphson
%method
%inputs:f=function,xi=intial guess,maxiter=max # of iterations,es=error
%output: root estimate
if nargin==2
    maxiter=50;es=0.01;
elseif nargin==3
    es=0.001;
end
syms x
d(x)=diff(f);%derive function
fplot(f), hold; fplot(d), grid, ylim([-50 50])
n(x)=x-(f(x)/d(x));%input newton Raphsons function
xiold=0; iter=0; ea=100;%Declare Xi guess,Xiold, iter counter, and error
plot(xi,f(xi),'b*')%plot initila guess
while iter<maxiter && ea>es%for loop till max iter
iter=iter+1;%add to iter
xiold=xi;%xiold is gets the value of xi
xi=double(n(xi));%execute raphson equation
plot(xi,f(xi),'r*')
ea=abs(((xi-xiold)/xi))*100;%check error
if ea<es%if error meets perameters leave loop
 break
end
end
t="the root estimate is";
t2="f at the estimate is";
t3="the # of iterations was";
disp(t)
disp(double(xi))%give value of xi
disp(t2)
disp(double(f(xi)))%find f(xi)
disp(t3)
disp(iter)
legend('f(x)','derivative','X0','Xi')
