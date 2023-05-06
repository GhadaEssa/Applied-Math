
disp('______________________________________________________________')
disp('             Hello in The Stress Calculator Program           ')
disp('______________________________________________________________')
% In this program will calculate the stress in 2D
%To get the stress result we must integrate The given value using some methods
%The methods adopted here are:
%In y-axis: Trapazoidal rule
%In X-axis:Simpson's rule


a=input('\n> Enter the lower limit of x-axis: ');
b=input('> Enter the upper limit of x-axis: ');
stripsX=input('> How many bar that you want to use in x-axis? ');
rows=input('> How many rows do you want? ');


c=input('> Enter the lower limit of y-axis: ');
d=input('> Enter the upper limit of y-axis: ');
stripsY=input('> How many bar that you want to use in y-axis? ');
columns=input('> How many columns do you want? ');
%-----------------------------------
intervalX=linspace(a,b,rows);
intervalY=linspace(c,d,columns);
%-----------------------------------




hX=(b-a)/stripsX;
hY=(d-c)/stripsY;

Matrix=zeros(rows,columns);
numOfVal=rows*columns;
fprintf('Please Enter %d value(You can ignore zero symmetric data on the axis): \n',numOfVal)
 
for i=1:rows
    for j=1:columns
        value=input('> Enter the data: ');
        Matrix(i,j)=value;
        disp(Matrix)
    end
end
 


for j=1:columns
    sum=0;
    for i=2:rows-1
       
        sum=Matrix(i,j)+sum;
        
    end

      y=hX/2*(Matrix(1,j)+2*sum+Matrix(rows,j));
      Matrix2(j)=y;
     
end
%Temporary matrix to store the values of x-axis after applied trapezoid
%rule on 1D

fprintf('\nThe results of the trapazoidal rule in x-direction are:\n')
disp(Matrix2)


len=length(Matrix2); 
sum2=0;
for i=2:2:len-1 
 sum2=sum2+Matrix2(i);
end
 

sum3=0;
for i=3:2:len-2 
 sum3=sum3+Matrix2(i);
end

 
 

evenNumber=mod(stripsY,2);
if(evenNumber==0)
fprintf('Now,We applied Simpson`s rule in Y-direction\n')    
I=hY/3*(Matrix2(1) + 4*sum2+ 2*sum3 + Matrix2(end));
fprintf('The stress is: %d\n\n',I)

else
    warning('The number of strips is not even,we can not apply the Simpson`s rule.')
end






fprintf('------------------------------------------\n')
disp('    Thank You for using this program      ')
disp('------------------------------------------')
 