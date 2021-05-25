%% %Задача 1 a
clear;
a = 0;
b = 2*pi;
mu = 0.1;
x = a:0.01:b;
f = @(x) exp(-mu*x.^2).*cos(x.^2);
hold on;
plot(x,f(x));
z = ginput(2);
[minx, miny] = fminbnd(f,z(1,1),z(2,1));
plot(z(1,1),f(z(1,1)),'Marker','*','MarkerSize', 5,'Color','green');
plot(z(2,1),f(z(2,1)),'Marker','*','MarkerSize', 5,'Color','green');
plot(minx,miny,'Marker','*','MarkerSize', 5,'Color','red');
hold off;
%% %Задача 1 b
clear;
cla;
a = 0;
b = 2*pi/3;
a1 = input("Введите переменную a1 в уравнении f(x)=1/(a1*cos(x)+b1*sin(x))^2: ");
b1 = input("Введите переменную b1 в уравнении f(x)=1/(a1*cos(x)+b1*sin(x))^2: ");
x = a:0.01:b;
f = @(x) 1./((a1.*cos(x)+b1.*sin(x)).^2);
hold on;
plot(x,f(x));
z = ginput(2);
[minx, miny] = fminbnd(f,z(1,1),z(2,1));
plot(z(1,1),f(z(1,1)),'Marker','*','MarkerSize', 5,'Color','green');
plot(z(2,1),f(z(2,1)),'Marker','*','MarkerSize', 5,'Color','green');
plot(minx,miny,'Marker','*','MarkerSize', 5,'Color','red');
hold off;
%% %Задача 1 d
clear;
cla;
a = 0;
b = 2*pi;
m = input("Введите m - количество сумм: ");
x = a:0.01:b;
y = 0;
for k = 1:1:m
    kA(k) = k;
    y = y+(cos(k*x)-sin(k*x)).^2;
end
f = @(x) sum((cos(kA.*x)-sin(kA*x)).^2);
hold on;
plot(x,y);
z = ginput(2);
[minx, miny] = fminbnd(f,z(1,1),z(2,1));
plot(z(1,1),f(z(1,1)),'Marker','*','MarkerSize', 5,'Color','green');
plot(z(2,1),f(z(2,1)),'Marker','*','MarkerSize', 5,'Color','green');
plot(minx,miny,'Marker','*','MarkerSize', 5,'Color','red');
hold off;
%% %Задача 2 a
clear;
cla;
a = input("Введите промежуток в котором будет изменяться параметр α в уравнении y = x^α*log(x): ");
x = linspace(0, 1, 100);
hold on;
for k = a
    y = x.^k.*log(x);
    f = @(x) x.^k.*log(x);
    plot(x,y);
    [minx, miny] = fminbnd(f,x(1),x(100));
    plot(minx,miny,'Marker','*','MarkerSize', 5,'Color','red');
end
hold off;
%% %Задача 2 b
clear;
cla;
a = input("Введите промежуток в котором будет изменяться параметр α в уравнении y = x^α*e^(-βx): ");
b = input("Введите промежуток в котором будет изменяться параметр β в уравнении y = x^α*e^(-βx): ");
x = linspace(-5, 5, 100);
hold on;
for k = a
    for p = b
        y = x.^k.*exp(-p*x);
        f = @(x) x.^k.*exp(-p*x);
        plot(x,y);
        [minx, miny] = fminbnd(f,x(1),x(100));
        plot(minx,miny,'Marker','*','MarkerSize', 5,'Color','red');
    end
end
hold off;
%% %Задача 2 c
clear;
cla;
a = input("Введите промежуток в котором будет изменяться параметр α в уравнении y = x^α(1-x)^β: ");
b = input("Введите промежуток в котором будет изменяться параметр β в уравнении y = x^α(1-x)^β: ");
x = linspace(-5, 5, 100);
hold on;
for k = a
    for p = b
        y = x.^k.*(1-x).^p;
        f = @(x) x.^k.*(1-x).^p;
        plot(x,y);
        [minx, miny] = fminbnd(f,x(1),x(100));
        plot(minx,miny,'Marker','*','MarkerSize', 5,'Color','red');
    end
end
hold off;