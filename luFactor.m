%Ryan Pfannenstiel, LU Factorization Function, MECH 105, 3.26.18
function [L, U , P] = luFactor(A)
%luFactor - Ferforms LU factorization on a given matrix. returns a upper
%triangle matrix, a lower triangle matrix, and a pivot matrix.
%
%Input - A = the coefficient matrix
%
%Outputs - L = lower triangle matrix
%        - U = Upper triangle matrix
%        - P = Pivot matrix

%check # of inputs
if nargin>1
error("Too many input arguments.")
end
%preallocate data for L, U, & P
L=eye(3); U=zeros(3); P=eye(3); PR=eye(3);
%declare extra variables
s=zeros(1,3);E = zeros(1,3);
%Check values for pivoting
if abs(A(3,1))>abs(A(2,1))&& abs(A(3,1))>abs(A(1,1))
U(1,:)=A(3,:);U(3,:)=A(1,:);U(2,:)=A(2,:);
P(1,:)=PR(3,:); P(3,:)=PR(1,:);
elseif abs(A(2,1))>abs(A(1,1))
U(1,:)=A(2,:);U(2,:)=A(1,:);U(3,:)=A(3,:);
P(1,:)=PR(2,:); P(2,:)=PR(1,:);
end
%Eliminate A_21 
ER1=(U(2,1)/U(1,1));
E=(U(1,:)*ER1);
U(2,:)=U(2,:)-E;
L(2,1)=ER1;
%Eliminate A_31
ER2=(U(3,1)/U(1,1));
E=(U(1,:)*ER2);
U(3,:)=U(3,:)-E;
L(3,1)=ER2;
%check again for pivoting
if abs(U(2,2))<abs(U(3,2))
s=U(2,:);
U(2,:)= U(3,:);U(3,:)=s;
P(2,:)=P(3,:); P(3,:)=PR(2,:);
L(3,1)=ER1;L(2,1)=ER2;
end
%Eliminate A_32
ER3=(U(3,2)/U(2,2));
E=(U(2,:)*ER3);
U(3,:)=U(3,:)-E;
L(3,2)=ER3;
end






