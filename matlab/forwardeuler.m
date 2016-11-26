function [y]=forwardeuler(a, b,h, y0, f)
% function [y]=forwardeuler(a, b,h, y0, f)
% Forward Euler Method
% end points a and b
% time step h	
% initial condition y0
% input function f

y(1)=y0;

t=a : h : b;
n=length(t);

for i=1:n-1
    y(i+1)=y(i)+h*f(t(i),y(i));
end
end