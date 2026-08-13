clear;clc;
n = 10;
x = chase([0,ones(1,n-1)],12*ones(1,n),[ones(1,n-1),0],[11,10*ones(1,n-2),11]);
%%
clear;clc;
A = [-55,-5,12;
    21,36,-13;
    24,7,47];
b = [41;52;12];
for i = 1:19
    SOR(A,b,0.1*i,[0;0;0]);
end
%%
clear;clc
n = 5;
A = ones(5,5);
b = zeros(5,1);
for i = 1 : n
    A(i,i) = n+i;
    b(i) = n;
end
Jacob(A,b,[zeros(n,1)]);
%%
clear;clc;
format long
f = @(x) atan(x);
a = 1;
b = 6;
x = linspace(a,b,11);
y = feval(f,x);
yh = Newton(x,y,[1.1,1.3]);
%%
clear;clc;
f = @(x) 1./(1+x.^2);
a = -5;
b = 5;
x = linspace(a,b,21);
y = feval(f,x);
xh = linspace(a,b,100);
yh = lagrange_cha(x,y,xh);
y_plot = feval(f,xh);
plot(xh,yh,'b',xh,y_plot,'r');
%%
clear;clc;
f = @(x) 1./(1+x.^2);
a = -5;
b = 5;
x = linspace(a,b,41);
y = feval(f,x);
xh = linspace(a,b,100);
yh = spline(x,y,xh);
y_plot = feval(f,xh);
plot(xh,yh,'b',xh,y_plot,'r');
%%
clear;clc;
x = [0,10,20,30,40,80,90,95];
y = [68,67.1,66.4,65.6,64.6,61.8,61.0,60];
[a,b] = least_squres_1(x,y);
xh = linspace(0,95,100);
plot(x,y,'b+',xh,a*xh+b,'r');
%%
clear;clc;
x = [1953,1964,1982,1990,2000];
y = [5.82,6.95,10.08,11.34,12.66];
[a,b,c] = least_squres_ex2(x,y);
xh = linspace(1953,2000,100);
plot(x,y,'b+',xh,(a+b*xh)./(1+c*xh));
%%
clear;clc;
f = @(x) 4./(1+x.^2);
a = 0;b=1;
y = simpson(f,a,b,2);
%%
clear;clc;
f = @(x) 4./(1+x.^2);
a = 0;b=1;
y = romberg(f,a,b);
%%
clear;clc;
f = @(x) 4./(1+x.^2);
a = 0;b=1;
y = Gauss(f,a,b);
%%
clear;clc;
a = 0;b = pi/4;
f = @(x) sqrt(4-(sin(x).^2));
y = romberg(f,a,b);
%%
clear;clc;
f1 = @(x) x.^5-3*x-10;
f2 = @(x) sin(10*x)+2*cos(x)-x-3;
f3 = @(x) x+atan(x)-3;
f4 = @(x) (x+2).*log(x.^2+x+1)+1;

df1 = @(x) 5*x.^4 - 3;
df2 = @(x) 10*cos(10*x) - 2*sin(x) - 1;
df3 = @(x) 1 + 1./(1+x.^2);
df4 = @(x) log(x.^2+x+1) + (x+2).*(2*x+1)./(x.^2+x+1);

g1 = @(x) nthroot(3*x + 10, 5);
g2 = @(x) sin(10*x) + 2*cos(x) - 3;
g3 = @(x) 3 - atan(x);
g4 = @(x) (-1 + sqrt(4*exp(-1./(x+2)) - 3)) / 2;
disp("=================1================");
xh = bisect(f1,1,2);
xh = bisect(f2,-5,-4);
xh = bisect(f3,1,2);
xh = bisect(f4,-3,-2);
disp("=================2================");
xh = fix_point(g1,2);
xh = fix_point(g2,2);
xh = fix_point(g3,2);
xh = fix_point(g4,-2.5);
disp("=================3================");
xh = newton_iter(f1,df1,1);
xh = newton_iter(f2,df2,-3);
xh = newton_iter(f3,df3,2.5);
xh = newton_iter(f4,df4,-2);
disp("=================4================");
xh = secant(f1,[1,2]);
xh = secant(f2,[-3.5,-4.5]);
xh = secant(f3,[1.5,2.5]);
xh = secant(f4,[-2.5,-3.5]);
%%
clear;clc;
v = @(X) [X(1)*X(2) - X(3)^2 - 1;
          X(1)*X(2)*X(3) - X(1)^2 - X(2)^2 - 2;
          exp(X(1)) - exp(X(2)) + X(3) - 3];

dv = @(X) [X(2), X(1), -2*X(3);
           X(2)*X(3)-2*X(1), X(1)*X(3)-2*X(2), X(1)*X(2);
           exp(X(1)), -exp(X(2)), 1];
xh = newton_iter(v,dv,[1,1,1]);
%%
clc;clear;
A = [1,3,3;
    2,1,3;
    3,3,6;];
v = [1;1;1];
lamuda = power_method(A,v);
lamuda = inverse_power_method(A,v);
lamuda = shift_power_method(A,v,-1);
lamuda = qr_method(A,v);
%%
clc;clear;
f = @(x,y)  -1./x.^2-y./x-y.^2;
y(1) = -1;
y = Euler(f,0.2,1,2,y(1));
disp("======================")
y = Euler_improved(f,0.2,1,2,y(1));
disp("======================")
y = RK4(f,0.2,1,2,y(1));
disp("======================")
y = trapze_method(f,0.2,1,2,-1);
disp("======================")