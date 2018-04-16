clc
clear
%%Ryan Pfannenstiel-MECH105-2.5.18
%MatlabMin Algorithm
min=1;% set min = 1
while min/2 ~= 0% divide min by 2 until min/2 =0
    min=min/2;
end
realmin = eps(0);%function to find the smallest value in matlab (thanks google!)
x =["calculated min", min, "real min", realmin];
disp(x)%displays both the min claculated and the real minimum of matlab
