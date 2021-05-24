%% %Задание 1
clear;
a = input("Введите переменную a в уравнении x^2-a=0: ");
f = @(x)x.^2- a;
X = fzero(f,0);
%% %Задание 2
clear;
a=-3; 
b=3;
m=100; 

f= sym('x').^2+2*sym('x')-1-sin(sym('x'));
X = vpasolve(f,[a b]);

f= @(x)x.^2+2*x-1-sin(x);
x1=linspace(a,b,m);
plot(x1, subs(f,'x',x1),x1,0*x1,':');
grid on;
xlabel('x');
ylabel('y')
z=ginput(1);
zr=fzero(f,z(1));
hold on;
plot(zr,f(zr),'r*');
hold off;
%% %Задание 3 a
clear;
a=-3; 
b=3;
m=100; 

f= sin(exp(sym('x')));
X = vpasolve(f,[a b]);

f= @(x)sin(exp(x));
x1=linspace(a,b,m);
plot(x1, subs(f,'x',x1),x1,0*x1,':');
grid on;
xlabel('x');
ylabel('y')
z=ginput(1);
zr=fzero(f,z(1));
hold on;
plot(zr,f(zr),'r*');
hold off;
%% %Задание 3 b
clear;
a=0; 
b=2*pi;
m=100; 

f= sin(sym('x').*(1-sym('x')));
X = vpasolve(f,[a b]);

f= @(x)sin((x).*(1-x));
x1=linspace(a,b,m);
plot(x1, subs(f,'x',x1),x1,0*x1,':');
grid on;
xlabel('x');
ylabel('y')
z=ginput(1);
zr=fzero(f,z(1));
hold on;
plot(zr,f(zr),'r*');
hold off;
%% %Задание 3 c
clear;
a=0; 
b=4*pi;
m=100; 

f= sym('x').*(sin(sym('x')))-cos(sym('x'));
X = vpasolve(f,[a b]);

f= @(x)x.*(sin(x))-cos(x);
x1=linspace(a,b,m);
plot(x1, subs(f,'x',x1),x1,0*x1,':');
grid on;
xlabel('x');
ylabel('y')
z=ginput(1);
zr=fzero(f,z(1));
hold on;
plot(zr,f(zr),'r*');
hold off;
%% %Задание 3 d
clear;
a=pi/2; 
b=3*pi;
m=100; 

f= sin(sym('x')).^2 +(0.5-1./sym('x'))*cos(sym('x'))-0.5;
X = vpasolve(f,[a b]);

f= @(x)sin(x).^2 +(0.5-1./x)*cos(x)-0.5;
x1=linspace(a,b,m);
plot(x1, subs(f,'x',x1),x1,0*x1,':');
grid on;
xlabel('x');
ylabel('y')
z=ginput(1);
zr=fzero(f,z(1));
hold on;
plot(zr,f(zr),'r*');
hold off;
%% %Задание 3 e
clear;
a=-2*pi; 
b=6*pi;
m=100; 

f= 5*exp(0.1*sym('x')).*sin(sym('x'))-0.1*sin(sym('x'));
X = vpasolve(f,[a b]);

f= @(x)5*exp(-0.1*x).*sin(x)-0.1*sin(x);
x1=linspace(a,b,m);
plot(x1, subs(f,'x',x1),x1,0*x1,':');
grid on;
xlabel('x');
ylabel('y')
z=ginput(1);
zr=fzero(f,z(1));
hold on;
plot(zr,f(zr),'r*');
hold off;
%% %Задание 3 f
clear;
a=-5; 
b=5;
m=100; 
n = input("Введите переменную a в уравнении x^n-1=0: ");

f= sym('x').^n-1;
X = vpasolve(f);

f= @(x)x.^n-1;
x1=linspace(a,b,m);
plot(x1, subs(f,'x',x1),x1,0*x1,':');
grid on;
xlabel('x');
ylabel('y')
z=ginput(1);
zr=fzero(f,z(1));
hold on;
plot(zr,f(zr),'r*');
hold off;
%% %Задание 4
clear;
f = @(x)x^2+1;
r = fzero(f, -1);

f = sym('x')^2+1;
r1 = solve(f);
%% %Задание 5
clear;
f = @(x)cos(x)-exp(0.001+x.^2);
r = fzero(f, 0);

f = cos(sym('x'))-exp(0.001+sym('x').^2);
r1 = solve(f);
x1 = linspace(-1,1,100);
plot(x1, subs(f,'x',x1));
grid on;
xlabel('x');
ylabel('y')
%% % Заданние 1 Метод Ньютона
cla;
clear;
a = -10;
b = 10;
h = 0.01;
iter = 100;
eps = 0.00001;
x = a:0.1:b;
y = 1 + x.*sin(x);

hold on;
plot(x, y,x,0*x,':', 'Color', 'blue');
grid on;
xlabel('x');
ylabel('y');

xapp = ginput(1);
xapp = xapp(1);
plot(xapp, 1+xapp.*sin(xapp),'Color', 'red', 'Marker', '*');

for i = 1:1:iter
    fx0 = 1+xapp.*sin(xapp);
    k = ((xapp+h).*sin(xapp+h)-xapp.*sin(xapp))./h;
    fcass=fx0+k.*(x-xapp);
    xapp2 = -fx0/k+xapp;
    line([xapp2, xapp],[0, fx0],'Color', 'red','Marker', '.');
    line([xapp2, xapp2],[0,1+xapp2.*sin(xapp2)],'Color', 'green', 'Marker', '.');
    xapp = xapp2;
    hold on
    plot(xapp, 1+xapp2.*sin(xapp2),'Color', 'red', 'Marker', '*');
    yx = 1+xapp2.*sin(xapp2);
    if yx<eps && yx>=0
        disp(xapp);
        disp(yx);
        disp(i);
        break;
    end
    
end
hold off;
%% % Заданние 1 Метод половинного деления
clear;
cla;
a = -10;
b = 10;
h = 0.01;
iter = 100;
eps = 0.001;
x = a:0.1:b;
y = sin(x)./x;

hold on;
plot(x, y,x,0*x,':', 'Color', 'blue');
grid on;
xlabel('x');
ylabel('y');
axis equal;

z1 = ginput(1);
z1 = z1(1);
z2 = ginput(1);
z2 = z2(1);
h1 = plot(z1, sin(z1)/z1,'Color', 'red', 'Marker', 'o', 'MarkerSize', 5);
h2 = plot(z2, sin(z2)/z2,'Color', 'red', 'Marker', 'o', 'MarkerSize', 5);

if sin(z1)/z1*sin(z2)/z2<0
    for i = 1:1:iter
        zhalf = (z1+z2)/2;
        h3 = plot(zhalf, sin(zhalf)/zhalf,'Color', 'red', 'Marker', 'o', 'MarkerSize', 5);
        if sin(z1)/z1*sin(zhalf)/(zhalf)<0
            z2 = zhalf;
        elseif sin(zhalf)/zhalf*sin(z2)/z2<0
            z1 = zhalf;
        end
        if sin(z1)/z1<eps && sin(z1)/z1>0
            disp(z1);
            disp(sin(z1)/z1);
            disp(i);
            break;
        end
        delete(h1);
        delete(h2);
        delete(h3);
        h1 = plot(z1, sin(z1)/z1,'Color', 'red', 'Marker', 'o', 'MarkerSize', 5);
        h2 = plot(z2, sin(z2)/z2,'Color', 'red', 'Marker', 'o', 'MarkerSize', 5);
    end
else
    fprintf("Wrong points");
end
hold off;