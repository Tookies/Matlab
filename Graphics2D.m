%% %Пример 2
phi = 0:0.001:2*pi;
R= sin(phi)./phi;
y = R.*sin(phi);
x = R.*cos(phi);
plot(x,y,'LineWidth', 2);
grid on;
title('R = sin(φ)/φ');
ylabel('f(x)');
xlabel('x');
%% %Пример 3
x = 0:0.001:2;
y = humps(x);
hold on
plot(x, humps(x));
x_index = find(y == max(y));
x_max = x(x_index);
plot(x_max, humps(x_max), 'LineWidth', 3,"Color",[0 0 1], 'Marker', 'o');
for x=0:0.001:2
    if humps(x)<40 && humps(x)>20
        plot(x, humps(x), 'LineWidth', 2,"Color",[1 0 0], 'Marker', 'O');
    end
end
grid on;
title('f(x) = humps(x)');
ylabel('f(x)');
xlabel('x');
hold off
%% %Задание 1
x = -15:0.1:15;
y = (x)+((1./x).^2);
plot(x, y,'LineWidth', 2);
grid on;
title('f(x) = x+(1/x)^2');
ylabel('f(x)');
xlabel('x');
%% %Задание 2
x = -15:0.1:15;
y = (2.*x)./(1+x.*x);
plot(x, y,'LineWidth', 2);
grid on;
title('f(x) = 2x/(1+x^2)');
ylabel('f(x)');
xlabel('x');
%% %Задание 8
phi = -pi/2:0.001:3*pi/2;
a=100;
b=2;
n=4;
m=14;
k=14;
R= a./(a+(phi - pi/2).^n).*(b-sin(k.*phi)-cos(m.*phi));
y = R.*sin(phi);
x = R.*cos(phi);
plot(x,y,'LineWidth', 2);
grid on;
title('R = a/(a+(φ-\pi/2)^n)*(b-sinkφ-cosmφ)');
ylabel('f(x)');
xlabel('x');
text(-3.9,3.5,'a=100; b=2; n=4; k=14;');
text(-3.9,3,'Я не нашёл m,');
text(-3.9,2.5,'пусть будет 14');
%% %Задание 12
t = -5:0.001:5;
a = 1/4;
b = 1/16;
m = 8;
n = 8;
s = 20;
x = (cos(t)-a.*cos(m.*t)+b.*sin(n.*t));
y = (sin(t)-a.*sin(m.*t)+b.*cos(n.*t));
hold on;
for k=1:1:s
    plot(x./k,y./k,'LineWidth', 2);
end
grid on;
title('Параметрически заданная функция');
ylabel('f(x)');
xlabel('x');
hold off;
%% %Задание 13(1)
x = 0.1:0.05:5;
y = cot(pi.*x)+acos(2.^x);
plot(x, y,'LineWidth', 2);
grid on;
title('f(x) = ctg(\pi*x)+arccos(2^x)');
ylabel('f(x)');
xlabel('x');
%% %Задание 13(2)
phi = -pi:0.001:pi;
a=1;
n=4;
R= a + abs(cos(n.*phi));
y = R.*sin(phi);
x = R.*cos(phi);
plot(x,y,'LineWidth', 2);
grid on;
title('R = a + |cos(n*φ)|');
ylabel('f(x)');
xlabel('x');
%% %Задание 13(3)
phi = 0:0.001:2*pi;
phi0 = pi/4;
n = 1;
m = 2;
x = sin(m.*phi).*cos(n.*phi+phi0);
y = sin(m.*phi).*sin(n.*phi+phi0);
plot(x,y,'LineWidth', 2);
grid on;
title('Параметрически заданная функция');
ylabel('f(x)');
xlabel('x');
%% %Задание 14(1)
%Бабочка Темпла Фея
phi = -pi:0.001:pi;
R = exp(1).^cos(phi)-2.*cos(4.*phi)+sin(phi./12).^5;
y = R.*sin(phi);
x = R.*cos(phi);
plot(x,y,'LineWidth', 2);
grid on;
title('Бабочка Темпла Фея');
ylabel('f(x)');
xlabel('x');
%% %Задание 14(2)
%Декартов лист
phi = -pi/2:0.01:pi/2;
a=5;
R = (3.*a.*cos(phi).*sin(phi))./(cos(phi).^3+sin(phi).^3);
y = R.*sin(phi);
x = R.*cos(phi);
plot(x,y,'LineWidth', 2);
ylim([-15 15]);
xlim([-15 15]);
grid on;
title('Декартов лист');
ylabel('f(x)');
xlabel('x');
%% %Задание 14(3)
%Овал Кассини
c = 2;
hold on;
for k=0.4:0.2:1.4
    a = c.*k;
    fimplicit(@(x,y) (x.^2+y.^2).^2-2.*c.^2.*(x.^2-y.^2)-a.^4+c.^4, 'LineWidth', 2);
end
grid on;
title('Овал Кассини');
ylabel('f(x)');
xlabel('x');
hold off;