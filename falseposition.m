function [root, fx, ea, iter] = falseposition(func,xl,xu,es,maxiter)
%falseposition - estimates the root of a given function using the 
%false postion method ( drawing a line between an upper and lower bound and
%finding the midpoint)
%
%Inputs - func = the function being evaluated
%         xl = the lower guess(bracket)
%         xu = the upper guess(bracket)
%         es = the desired relative error [defaulted to 0.0001]
%         maxiter = the maximum number of iterations [default to 200]
%Outputs - root = the estimated root location
%          fx = the function evaluated at the estimated root location
%          ea = the approximate relative error(%)
%          iter = number of iterations calculated
%check # of inputs
if nargin <3 || nargin >5
    error('please input atleast a function and both a upper and lower guess') %if there are too many or not enough *error*
elseif nargin ==3%if there are only 3
    es= 0.0001; maxiter= 200;%then set es and maxiter to default
elseif nargin ==4
    maxiter= 200;    
end
if (func(xl)*func(xu))>= 0 %if there isnt a root between xu and xl 
    error('there is no root between the upper and lower estimates or one of the estimates is a root')
end
root =0;iter =0; %declare variables
for k=1:maxiter %loop iterates until maxiter is met
    iter =iter+1;%increase iter by 1
    rootold = root;
    root= xu - (func(xu)*(xl-xu))/(func(xl)-func(xu));%calculate xr using false position formula
    ea= abs((root-rootold)/root)*100;%calculate error
    if ea <es%if error is less than es
        break%then leave loop
    end
    if func(root)*func(xu) <0%if there is a sign change between xu and xr
        xl = root;%then use xr and xu as new guesses
    else%else use xl xr as new bound
        xu = root;
    end
end%end the loop
fx=double(func(root));%set fx to the function calculated at root location
root= double(root);ea= double(ea);%convert vars to double 
end




