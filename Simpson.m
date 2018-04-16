
function I = Simpson(x,y)
%Simpson - Integrates data using simpsons 3/4 rule to numerically integrate
% two vectors. One vector containing xvalues and one containing yvalues.If
% the number of intervals is odd then the trapezoidal rule is used for the
% last interval
%
%Inputs- x- row or column vector containing x values
%        y- row or column vector contianing y values
%
%Outputs- I- the resulting estimate of the integral

%RyanPfannenstiel-4.9.18-MECH 105 
%Check input
if nargin ~= 2
    error('THE FUNCTION REQUIRES AN X AND Y VECTOR')
end
%Check arrays have equal length
if length(x) ~= length(y)
    error('ARRAY X MUST HAVE THE # OF VALUES AS ARRAY Y')
end
%Check if equall spaced (diff function)
d=diff(x);
if (max(d)-min(d)> 0.0000000001)
    error('X MUST BE EQUALLY SPACED')
end
d=diff(y);
if (max(d)-min(d)> 0.0000000001)
    error('Y MUST BE EQUALLY SPACED')
end
%Check if trapazoidal integration is needed(odd or even)
t=0;
if mod(length(x),2)==0
    t = 1;
%if array is odd let the user know trap is used on final section
    w = 'Trapezoidal Rule was used on the final interval of the data';
    disp(w)
end
%Use simpsons composite rule to on whole vector set (if odd do length minus one)
if t~= 1
n=length(y)-1;b=x(end);a=x(1);
    I= double((((b-a)/n)/3)*(y(1)+4*sum(y(2:2:end))+2*sum(y(3:2:end-2))+y(end)));   
%use trap rule on final section if necessary
else
    n=length(y)-2;b=x(end-1);a=x(1);
    I= (((b-a)/n)/3)*(y(1)+4*sum(y(2:2:end-1))+2*sum(y(3:2:end-3))+y(end-1));
    n=1;b=x(end);a=x(end-1);
    T=(((b-a)/n)/2)*(y(end-1)+y(end));
    %set answer equal to simpsons composite + trap
I=double(I+T);
end
disp(I)