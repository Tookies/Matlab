%% %Задание 1
clear;
P = [1, -3.55, 5.1, -3.1];
x=linspace(-1,2,100);
hold on;
F=polyval(P,x);
plot(x,F);
format short;
R=roots(P);
plot(x,0*x);
for x=1:1:size(R)
    if isreal(R(x))
        plot(R(x),0*R(x), 'o');
    end
end
grid on;
ylabel('f(x)');
xlabel('x');
hold off;
%% %Задание 2
clear;
P =[1,0.1,0.2,-0.2,-2,1];
x=linspace(-1.2,1.2,800);
R=roots(P);
for a=1:1:size(R)
    if isreal(R(a))
        x0 = R(a);
    end
end
for a=1:1:size(R)
    if isreal(R(a)) && x0<R(a)
        x0 = R(a);
    end
end
x0 = x0*1/2;
x1 = -x0;
f = sym('x').^5+0.1*sym('x').^4+0.2*sym('x').^3-0.2*sym('x').^2-2*sym('x')+1;
fdiff = diff(sym('x').^5+0.1*sym('x').^4+0.2*sym('x').^3-0.2*sym('x').^2-2*sym('x')+1);
fx0 = subs(f,'x',x0);
k = subs(fdiff,'x',x0);
fcass=sym('fx0s')+sym('ks').*(x-sym('x0s'));
fcass=subs(fcass,'ks',k);
fcass=subs(fcass,'x0s',x0);
fcass=subs(fcass,'fx0s',fx0);
fx1 = subs(f,'x',x1);
k1 = subs(fdiff,'x',x1);
fnorm = sym('fx1s')+sym('k1s').*(x-sym('x1s'));
fnorm=subs(fnorm,'k1s',-1./k1);
fnorm=subs(fnorm,'x1s',x1);
fnorm=subs(fnorm,'fx1s',fx1);
alpha = atan(-1./k1);
y1 = subs(f, 'x', x1);
x2 = x1+cos(alpha);
y2 = y1+sin(alpha);
hold on;
F=polyval(P,x);
plot(x,F, 'LineWidth', 1.5);
plot(x,fcass, 'LineWidth', 1.5);
line([x1,x2], [y1,y2],'LineWidth', 1.5)
plot(x,fnorm,'LineWidth', 0.8);
grid on;
ylabel('f(x)');
xlabel('x');
hold off;
axis equal;
%% %Задание 3
clear;
A1 =[2, -3, 4, -5, 6];
B1 =[1, -3, 1];
[q1,r1] = deconv(A1,B1);
A2 = [1, -3, -1, -1];
B2 = [3, -2, 1];
[q2,r2] = deconv(A2,B2);
%% %Задание 4
clear;
f = [1, -2, 6, -10, 16];
x0 = 4;
f0 = f;
sizef = size(f);
for a=1:1:2
    for b=2:1:sizef(2)-a+1
        f0(b) = f0(b-1)*x0+f0(b);
    end
end
fx0 = f0(sizef(2));
fdiffxo = f0(sizef(2)-1);

g = [1, 1+2i, -1-3i, 7];
x0 = -2-i;
g0 = g;
sizeg = size(g);
for a=1:1:2
    for b=2:1:sizeg(2)-a+1
        g0(b) = g0(b-1)*x0+g0(b);
    end
end
gx0 = g0(sizeg(2));
gdiffxo = g0(sizeg(2)-1);
%% %Задание 5
clear;
f = sym('x').^(2.*sym('n'))-sym('n').*sym('x').^(sym('n')+1)+sym('n').*sym('x').^(sym('n')-1)-1;
n = input("Введите степень n в уравнении x^2*n-n*x^(n+1)+n*x^(n-1)-1: ");
f = subs(f,'n',n);
F = sym2poly(f);
R=roots(F);
Rsize = size(R);
fdiff = diff(f);
xmulti = R;
for a=1:1:Rsize(1)
    if ~isreal(R(a))
        xmulti(a)=NaN;
    end
    if ~subs(fdiff,'x',int8(R(a)))==0
        xmulti(a)=NaN;
    end
end
xmin = min(xmulti,[],'omitnan');
xmax = max(xmulti,[],'omitnan');
line([xmin,xmax], [0,0],'LineWidth', 1.5)
grid on;
ylabel('f(x)');
xlabel('x');
%% Задание 6
clear;
[r1,p1,K1]=residue([1,0,0],conv([1,-1],conv([1,2],[1,3])));
[r2,p2,K2]=residue([1,3],conv([1,-1],[1,0,1]));
[r3,p3,K3]=residue([1,0,0],[1,0,0,0,-1]);
%% Задание 7 1
clear;
n = input("Введите количество переменных n для построение полинома: ");
x1 = zeros([1,n]);
y1 = zeros([1,n]);
for a=1:1:n
    x1(a) = a;
    y1(a) = 1./a;
end
f1 = polyfit(x1,y1,n);
Rf = roots(f1);
Rfcopy = Rf;
b=0;
for a = 1:1:n
    if ~isreal(Rfcopy(a))
        Rfcopy(a)= NaN;
        b = b+1;
    end
end
xex=0;
TF = isnan(Rfcopy);
if n-b==1
  for a = 1:1:n
      if TF~=1
          xex = Rfcopy(a);
      end
  end
end
xmin = min(Rfcopy,[],'omitnan');
xmax = max(Rfcopy,[],'omitnan');
if n-b==1
    plot(xex,0,'o')
else
    line([xmin,xmax], [0,0],'LineWidth', 1.5);
end
grid on;
ylabel('f(x)');
xlabel('x');
%% Задание 7 2
clear;
x2 = [-1, 0, 1, 2, 3];
y2 = [6, 5, 0, 3, 2];
f2 = polyfit(x2,y2,5);
Rf = roots(f2);
Rfcopy = Rf;
b=0;
for a = 1:1:5
    if ~isreal(Rfcopy(a))
        Rfcopy(a)= NaN;
        b = b+1;
    end
end
xex=0;
TF = isnan(Rfcopy);
if 5-b==1
  for a = 1:1:5
      if TF~=1
          xex = Rfcopy(a);
      end
  end
end
xmin = min(Rfcopy,[],'omitnan');
xmax = max(Rfcopy,[],'omitnan');
if 5-b==1
    plot(xex,0,'o')
else
    line([xmin,xmax], [0,0],'LineWidth', 1.5);
end
grid on;
ylabel('f(x)');
xlabel('x');
%% Задание 8 1
clear;
f = [1,-6,15,-14]
Rf = roots(f);
fsize = size(Rf);
Rfcopy = Rf;
b=0;
for a = 1:1:fsize(1)
    if ~isreal(Rfcopy(a))
        Rfcopy(a)= NaN;
        b = b+1;
    end
end
xex=0;
TF = isnan(Rfcopy);
if fsize(1)-b==1
  for a = 1:1:fsize(1)
      if TF~=1
          xex = Rfcopy(a);
      end
  end
end
xmin = min(Rfcopy,[],'omitnan');
xmax = max(Rfcopy,[],'omitnan');
if fsize(1)-b==1
    plot(xex,0,'o')
else
    line([xmin,xmax], [0,0],'LineWidth', 1.5);
end
grid on;
ylabel('f(x)');
xlabel('x');
%% Задание 8 2
clear;
f = [24,10,-1,-19,-5,6]
Rf = roots(f);
fsize = size(Rf);
Rfcopy = Rf;
b=0;
for a = 1:1:fsize(1)
    if ~isreal(Rfcopy(a))
        Rfcopy(a)= NaN;
        b = b+1;
    end
end
xex=0;
TF = isnan(Rfcopy);
if fsize(1)-b==1
  for a = 1:1:fsize(1)
      if TF~=1
          xex = Rfcopy(a);
      end
  end
end
xmin = min(Rfcopy,[],'omitnan');
xmax = max(Rfcopy,[],'omitnan');
if fsize(1)-b==1
    plot(xex,0,'o')
else
    line([xmin,xmax], [0,0],'LineWidth', 1.5);
end
grid on;
ylabel('f(x)');
xlabel('x');
%% Задание 8 3
clear;
f = [1,-6,11,-1,-18,20,-8]
Rf = roots(f);
fsize = size(Rf);
Rfcopy = Rf;
b=0;
for a = 1:1:fsize(1)
    if ~isreal(Rfcopy(a))
        Rfcopy(a)= NaN;
        b = b+1;
    end
end
xex=0;
TF = isnan(Rfcopy);
if fsize(1)-b==1
  for a = 1:1:fsize(1)
      if TF~=1
          xex = Rfcopy(a);
      end
  end
end
xmin = min(Rfcopy,[],'omitnan');
xmax = max(Rfcopy,[],'omitnan');
if fsize(1)-b==1
    plot(xex,0,'o')
else
    line([xmin,xmax], [0,0],'LineWidth', 1.5);
end
grid on;
ylabel('f(x)');
xlabel('x');
%% Задача 9
clear;
n = input("Введите размерность матрицы nxn: ");
X = rand(n);
e = eig(X);
f = poly(e);
y = polyval(f,X);
TF = (y==zeros(n));
%% Задача 10 1
clear;
f = [1, 2, -1, -4, -2];
g = [1, 1, -1, -2, -2];
% Rf = roots(f);
% Rfsize = size(Rf);
% Rg = roots(g);
% Rgsize = size(Rg);
% TF = zeros(size(Rf));
% for a = 1:1:Rfsize(1)
%     for b = 1:1:Rgsize(1)
%         if (abs(Rf(a)-Rg(b)))<=1e-10 
%             TF(a) = Rf(a);
%         end
%     end
% end
% nodfg = poly(TF);
[q,r] = deconv(f,g);
f1 = g;
g1 = r;
u_2 = [0,1];
u_1 = [0,-q];
u = [0,-q];
% u при g, v при f
v_2 = [0,0];
v_1 = [0,1];
v = [0,1];
while f1(1)==0
    f1(:,1) = [];
end
while g1(1)==0
    g1(:,1) = [];
end
while min(r)~=0 || max(r)~=0
    [q,r] = deconv(f1,g1);
    f1 = g1;
    g1 = r;
    while f1(1)==0
        f1(:,1) = [];
    end
    while g1(1)==0 && (min(r)~=0 || max(r)~=0)
        g1(:,1) = [];
    end
    u = conv(-q, u_1);
    usize = size(u);
    u_2size = size(u_2);
    while u_2size(2)<usize(2)
        u_2 = [0,u_2];
        u_2size = size(u_2);
    end
    u = u+u_2;
    v = conv(-q, v_1);
    vsize = size(v);
    v_2size = size(v_2);
    while v_2size(2)<vsize(2)
        v_2 = [0,v_2];
        v_2size = size(v_2);
    end
    v = v+v_2;

    u_2 = u_1; 
    u_1 = u;
    v_2 = v_1; 
    v_1 = v;
end
nodfg = f1;
%% Задача 10 2
clear;
f = [1, 3, 1, 1, 3, 1];
g = [1, 2, 1, 2];
[q,r] = deconv(f,g);
f1 = g;
g1 = r;
u_2 = [0,1];
u_1 = [0,-q];
u = [0,-q];
% u при g, v при f
v_2 = [0,1];
v_1 = [0,1];
v = [0,1];
while f1(1)==0
    f1(:,1) = [];
end
while g1(1)==0
    g1(:,1) = [];
end
while min(r)~=0 || max(r)~=0
    [q,r] = deconv(f1,g1);
    f1 = g1;
    g1 = r;
    while f1(1)==0
        f1(:,1) = [];
    end
    while g1(1)==0 && (min(r)~=0 || max(r)~=0)
        g1(:,1) = [];
    end
    u = conv(-q, u_1);
    usize = size(u);
    u_2size = size(u_2);
    while u_2size(2)<usize(2)
        u_2 = [0,u_2];
        u_2size = size(u_2);
    end
    u = u+u_2;
    v = conv(-q, v_1);
    vsize = size(v);
    v_2size = size(v_2);
    while v_2size(2)<vsize(2)
        v_2 = [0,v_2];
        v_2size = size(v_2);
    end
    v = v+v_2;

    u_2 = u_1; 
    u_1 = u;
    v_2 = v_1; 
    v_1 = v;
end
nodfg = f1;
%% Задача 10 3
clear;
f = [1,-1,-4,4,1];
g = [1,-1,-1];
[q,r] = deconv(f,g);
f1 = g;
g1 = r;
u_2 = [0,1];
u_1 = [0,-q];
u = [0,-q];
% u при g, v при f
v_2 = [0,1];
v_1 = [0,1];
v = [0,1];
while f1(1)==0
    f1(:,1) = [];
end
while g1(1)==0
    g1(:,1) = [];
end
while min(r)~=0 || max(r)~=0
    [q,r] = deconv(f1,g1);
    f1 = g1;
    g1 = r;
    while f1(1)==0
        f1(:,1) = [];
    end
    while g1(1)==0 && (min(r)~=0 || max(r)~=0)
        g1(:,1) = [];
    end
    u = conv(-q, u_1);
    usize = size(u);
    u_2size = size(u_2);
    while u_2size(2)<usize(2)
        u_2 = [0,u_2];
        u_2size = size(u_2);
    end
    u = u+u_2;
    v = conv(-q, v_1);
    vsize = size(v);
    v_2size = size(v_2);
    while v_2size(2)<vsize(2)
        v_2 = [0,v_2];
        v_2size = size(v_2);
    end
    v = v+v_2;

    u_2 = u_1; 
    u_1 = u;
    v_2 = v_1; 
    v_1 = v;
end
nodfg = f1;
%% %Задача 11
clear;
X = ones([100,1]);
Y = poly(X);
R = roots(Y);
x=linspace(-10,10,800);
F=polyval(Y,x);
hold on
plot(x,F);
for a=1:1:100
    plot(R(a), (R(a)-1).^100,'o')
end
grid on;
ylabel('f(x)');
xlabel('x');
hold off;