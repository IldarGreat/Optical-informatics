#3
n = 2000;
#4 
a = -5;
b = 5;
hx = (b-a)/n;
x = (a:hx:b - hx);
size(x)
#5
f = (4.*x.^2 - 2).*exp((-x.^2)./2);
#6
figure(1)
plot(x, f)
xlabel("x");
ylabel("y");
title("Function f(x)");

figure(2)
plot(x, abs(f))
xlabel("x");
ylabel("y");
title("Amplitude of function f(x)");

figure(3)
plot(x, arg(f))
xlabel("x");
ylabel("y");
title("Phase of function f(x)");

#7
int = sum(f*hx);
#8
m = 1000;
p = -5;
q = 5;
hE = (q - p)/m;
E = (p: hE: q - hE);
size(E)
#9
A = exp(-2*pi*1i*E'.*x);

figure(4)
imagesc(abs(A))

figure(5)
imagesc(arg(A))

#10
F = A*f'.*hx;
figure(6)
plot(E, F)
xlabel("x");
ylabel("y");
title("Function F(x)");

figure(7)
plot(E, abs(F))
xlabel("x");
ylabel("y");
title("Amplitude of function F(E)");

figure(8)
plot(E, arg(F))
xlabel("x");
ylabel("y");
title("Phase of function F(E)");

#12
###

#13
B = A';
f2 = (B*F).*hE;

#14
figure(11)
hold on
plot(x, abs(f));
plot(x, abs(f2));
title("Amplitude");
hold off

figure(12)
hold on
plot(x, arg(f));
plot(x, arg(f2));
title("Phase");
hold off





