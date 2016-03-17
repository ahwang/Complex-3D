% Andrew Hwang
% MATH241
% Matlab Project 3
%% Number 1
f=inline('x.^2+y.^2-z.^2','x','y','z')
corners=[-2 2 -2 2 -2 2];
subplot(2,2,1)
impl(f,corners,1)
title('c = 1')
subplot(2,2,2)
impl(f,corners,.1)
title('c = .1')
subplot(2,2,3)
impl(f,corners,0)
title('c = 0')
subplot(2,2,4)
impl(f,corners,-.5)
title('c = -.5')
%% Number 2
f=inline('x.^2+y.^2+z.^2+x.*y.^2')
corner=[-4 2 -2 1 -2 2];
subplot(2,2,1)
impl(f,corners, 1.2)
view(68,34)
subplot(2,2,2)
impl(f,corners, 1)
view(68,34)
subplot(2,2,3)
impl(f,corners, .8)
view(68,34)
subplot(2,2,4)
impl(f,corners, .5)
view(68,34)
figure
subplot(2,2,1)
impl(f,corners, .3)
view(68,34)
subplot(2,2,2)
impl(f,corners, .2)
view(68,34)
% The level set Sc breaks into two components at c = 1
%% Number 3
[X,Y]= meshgrid(0:.4:2);
U=-X/2;
V=Y/2;
W=1+0*X;
subplot(1,2,1)
for z = [-1, 0, 1]% First plot the surface with a finer mesh.
[XX,YY]=meshgrid(0: .05 : 2);
ZZ=.25*(XX.^2-YY.^2);
subplot(1,2,2)
surf(XX, YY, ZZ); shading interp
hold on
% Now add the vector field.
Z=.25*(X.^2-Y.^2);
quiver3(X,Y,Z,U,V,W)
axis image
Z=z+0*X;
quiver3(X,Y,Z,U,V,W)
hold on
end
axis image
hold off
%% Number 4
a=2;
u=linspace(0,pi,41);
v=linspace(0,2*pi,41);
[U,V]=meshgrid(u,v);
X=a*sin(U).*cos(V);
Y=a*sin(U).*sin(V);
Z=a*cos(U);
surf(X,Y,Z)
hold off
%% Number 5
a=.5;
r=2;
u=linspace(0,2*pi,41);
v=linspace(0,2*pi,41);
[U,V]=meshgrid(u,v);
X=cos(U).*(r+a.*cos(V)); 
Y=sin(U).*(r+a.*cos(V));
Z=a.*sin(V);
surf(X,Y,Z)
axis equal
hold off
%% Number 6
syms s t
% vertical cylinder of radius 1.
x=cos(s);
y=sin(s);
z=t;
ezsurf(x,y,z,[0 2*pi -2 2])
hold on
% handle formed by half of a torus with r=1, a=.25
% centered at (1,0,.5)
xhandle=1+cos(s)*(1+.25*cos(t));
yhandle=.25*sin(t)
zhandle= .5+sin(s)*(1+.25*cos(t));
ezsurf(xhandle,yhandle,zhandle,[-pi/2 pi/2 0 2*pi])
hold off
axis([-2 3 -2 2 -2 2])
view(34,34)