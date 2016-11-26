function [x,y,z] = climate(p, r, s,q, initV, T, eps)
% 
%       INITV   - initial point
%       T       - time interval
%       EPS     - ode solver precision
%
% Example.
%        [X Y Z]=climate(1,0.8,0.8,1.2)
%        plot3(X,Y,Z);

if nargin<4
  error('MATLAB:lorenz:NotEnoughInputs','Not enough input arguments.'); 
end

if nargin<5
  eps = 0.000001;
  T = [0 10];
  initV = [0.001 0.001 0.001];
end

if nargin<6
  eps = 0.000001;
  T = [0 100];
end

options = odeset('RelTol',eps,'AbsTol',[eps eps eps/10]);
[T,X] = ode45(@(T,X) F(T, X, p, r, s,q), T, initV, options);
Tscale = 10;
Tdim = T*Tscale;
figure(1)
plot3(X(:,1),X(:,2),X(:,3),'r');
axis equal;
grid;
title('Phase portraits');
xlabel('X'); ylabel('Y'); zlabel('Z');
hold on

figure(2)
subplot(3,1,1);
plot(Tdim,X(:,1),'r');
ylabel('X'); 
subplot(3,1,2);
plot(Tdim,X(:,2),'g');
ylabel('Y'); 
subplot(3,1,3);
plot(Tdim,X(:,3),'b');
xlabel('kyr'); ylabel('Z');

x = X(:,1);
y = X(:,2);
z = X(:,3);
return
end
