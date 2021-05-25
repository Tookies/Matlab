%% %Задача 1.1
clear;
A = sym('x')^5+4*sym('x')^4-2*sym('x')^3-14*sym('x')^2-3*sym('x')-18;
disp(factor(A));
%% %Задача 1.2
clear;
A = sym('x')^3+sym('x')^2*sym('y')+sym('x')^2-2*sym('x')*sym('y')^2+sym('x')*sym('y')-2*sym('y')^2;
disp(factor(A));
%% %Задача 2.1
clear;
syms x;
y = x*exp(-x);
disp(limit(y,inf));
%% %Задача 2.2
clear;
syms x;
y = (tan(x))^(tan(2*x));
disp(limit(y,x,pi/4));
%% %Задача 2.3
clear;
syms x;
y = atan(1/(1-x));
disp(limit(y,x,1,"right"));
%% %Задача 2.4
clear;
syms x;
y = (7*x^3+x^2-1)/(5*x^2+2*x+1);
disp(limit(y,inf));
%% %Задача 2.5
clear;
syms x;
syms h;
y =((x+h)^(1/2)-x^(1/2))/h;
disp(limit(y,h,0));
%% %Задача 3.1
clear;
syms x;
y = atan(x)/2-x/(2*(1+x^2)^2);
disp(simplify(diff(y)));
%% %Задача 3.2
clear;
syms x;
y = 3*x^4-14*x^3+12*x^2+24*x+6;
disp(diff(y));
%% %Задача 3.3
clear;
syms x;
y = (sin(3*x)-cos(3*x))^2;
disp(simplify(diff(y)));
%% %Задача 3.4
clear;
syms x;
y = log(x^2+2)/2+(2-x)/(4*(x^2+2))-1/(4*2^(1/2))*atan(x/2^(1/2));
disp(simplify(diff(y)));
%% %Задача 3.5
clear;
syms x;
y = 1/6*log((x-3)/(x+3));
disp(simplify(diff(y)));
%% %Задача 4.1
clear;
syms x;
y = (1-x^2)^(1/2)/x^2;
disp(int(y));
%% %Задача 4.2
clear;
syms x;
y = 1/(sin(x))^3;
disp(int(y));
%% %Задача 4.3
clear;
syms x;
y = (sin(2*x)+1)^(1/7)*cos(2*x);
disp(int(y));
%% %Задача 4.4
clear;
syms x;
y = 15*(x+3)^(1/2)/((x+3)^2*(x)^(1/2));
disp(int(y,1/8,1));
%% %Задача 4.5
clear;
syms x;
y = 1/(1+x^2);
disp(int(y,0,+inf));
%% %Задача 4.6
clear;
syms x;
y = 1/(x^2-1);
disp(int(y,-2,2));
%% %Задача 4.7
clear;
syms x;
y = log(sin(x));
disp(int(y,0,pi/2));
%% %Задача 5.1
clear;
syms k;
mem = 1/k^2;
disp(symsum(mem,1,inf));
%% %Задача 5.2
clear;
syms n;
mem = (-1)^((n^2+n)/2)*n/2^n;
disp(symsum(mem,1,inf));
%% %Задача 5.3
clear;
syms k;
syms x;
mem = x^(k);
disp(symsum(mem,k,0,inf));
%% %Задача 5.4
clear;
syms k;
syms x;
mem = (3-x)^(2*k)/k^(1/2);
disp(symsum(mem,k,0,inf));
%% %Задача 5.5
clear;
syms k;
syms x;
mem = 1/(x-k)^3;
disp(symsum(mem,k,-inf,inf));
%% %Задача 6
%Функция 6.1
clear;
syms x;
y1 = exp(x);
n=5;
t1 = taylor(y1,x,"Order", n);

%Функция 6.2
y2 = log(2*x-1);
n=3;
t2 = taylor(y2,x,1,"Order", n);

%Функция 6.3
y3 = (sin(x))^2;
n=10;
t3 = taylor(y3,x,"Order", n);

ezplot(y1, 0, 3);
title('');
hold on;
ezplot(t1, 0, 3);
title('');
hold on;
ezplot(y2, 0, 3);
title('');
hold on;
ezplot(t2, 0, 3);
title('');
hold on;
ezplot(y3, 0, 3);
title('');
hold on;
ezplot(t3, 0, 3);
title('');
axis equal;
grid on;
hold off;
%% %Задача 7
clear;
cla;
syms x; 
y = exp(1/(1-x^2))/(1+x^2);
k = limit(y/x, inf);
b = limit(y-k*x, inf);
yasy = k*x+b;
f1 = diff(y);
xf1 = solve(f1);
f2 = diff(f1);
xf2 = solve(f2);
hold on;
ezplot(y, -7, 7);
hold on;
ezplot(yasy, -7, 7);
for a = 1:1:length(xf1)
    if isreal(double(xf1(a)))&& double(xf2(a))<10
        plot(double(xf1(a)),eval(subs(y,'x',xf1(a))),'Marker','o','MarkerSize', 6,'Color','red');
    end
end
for b = 1:1:length(xf2)
    if isreal(double(xf2(b))) && double(xf2(b))<10
        plot(double(xf2(b)),subs(y,'x',xf2(b)),'Marker','o','MarkerSize', 5,'Color','green');
    end
end
xlabel('X');
ylabel('Y');
grid on;
hold off;
%% %Задача 8
clear;
cla;
syms x; 
y = sin(x)/(x^2+1);
fdiff = diff(y);
xdiff = vpasolve(fdiff);
y1 = matlabFunction(y);
y2 = y1(-x);
y2 = matlabFunction(y2);
[minx,miny] = fminbnd(y1,-5,5);
[maxx,maxy] = fminbnd(y2,-5,5);
hold on;
ezplot(y, -5, 5);
hold on;
plot(minx,miny,'Marker','o','MarkerSize', 5,'Color','red');
plot(maxx,-maxy,'Marker','o','MarkerSize', 5,'Color','red');
xlabel('X');
ylabel('Y');
grid on;
hold off;
%% %Задача 9
clear;
syms t;
syms u;
x = t*cos(u)*cos(u);
y = t^2*cos(u)*sin(u);
z = t^3*sin(u);
x1 = diff(x); x2 = diff(x1); x3 = diff(x2);
y1 = diff(y); y2 = diff(y1); y3 = diff(y2);
z1 = diff(z); z2 = diff(z1); z3 = diff(z2);
curvature = (((y1*z2-y2*z1)^2+(z1*x2-z2*x1)^2+(x1*y2-x2*y1)^2)/(x1^2+y^2+z^2)^3)^(1/2);
disp(curvature);
torsion = det([x1 y1 z1; x2 y2 z2; x3 y3 z3])/curvature^2;
disp(torsion);