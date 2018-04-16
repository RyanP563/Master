function [mat] = specialmatrix(n,m)
%specialmatrix - creates a n by m matrix in which the value of each element
%is equal to the sum of the element above and the element to the left
%
%Inputs - n=# of rows, m=# of columns
%outputs - n by m matrix 
if nargin<1||nargin>2
    error('exactly 2 inputs must be entered')
end
mat=zeros(n,m);%preallocates space for array
for k=1:n
    for h=1:m
        if k==1
            mat(k,h)=h;%if it is the first row it is numbered 1 through m
        elseif h==1
            mat(k,h)=k;%if it is the first column it is numbere 1 through n
        else
            mat(k,h)= mat(k-1,h)+mat(k,h-1);%The element is set equal to 
            %the sum of the element to the left and the element above
        end
    end
end
end

