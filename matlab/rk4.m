function [ y ] = rk4( a,b,h,y0, f)
% function [ y ] = rk4( a,b,h,y0, f)
% Runge-Kutta fourth order method
% end points a and b
% time step h	
% initial condition y0
% input function f

y(1)=y0;

t=a : h : b;
n=length(t);

for i=1:n-1
    f1=f(t(i),y(i));
    Y2=y(i)+0.5*h*f1;
    f2=f(t(i)+h/2, Y2);
    Y3=y(i)+0.5*h*f2;
    f3=f(t(i)+h/2, Y3);
    Y4=y(i)+h*f3;
    f4=f(t(i)+h, Y4);
    y(i+1)=y(i)+(h/6)*(f1+2*f2+2*f3+f4);
end

end