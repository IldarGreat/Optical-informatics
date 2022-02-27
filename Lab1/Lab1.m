#3
n = 1000;

#4
a = -10;
b = 10;
h = (b-a)/n;
x = a:h:b;
if(length(x)==n+1)
x(end) = [];
endif

#5
f = besselj(1,3*x);

#6
plot(x,f)
xlabel("x");
ylabel("bessel(3x)");

#7
f = besselj(1,2*(3*x));
plot(x,f)
xlabel("x");
ylabel("bessel(6x)");
f = besselj(1,3*(x+5));
plot(x,f)
xlabel("x");
ylabel("bessel(3(x+5))");
f = besselj(1,3*x);

#8
plot(x(1:end/4),f(1:end/4))
xlabel("x");
ylabel("bessel(3x)");
title("Первая четверть интервалов");
plot(x(end/4:3*end/4),f(end/4:3*end/4))
xlabel("x");
ylabel("bessel(3x)");
title("Середина графика");

#9
domain = x > 0 & x < 7;
plot(x(domain),f(domain));
xlabel("x(domain)");
ylabel("bessel(3x)");

#10
g = cos(x);

#11
fplusg = f.+g;
fmultig = f.*g;

#12
plot(x,f,"-;f(x);")
hold on;
plot(x,g,"-.;g(x);")
plot(x(1: 30: end),fplusg(1: 30: end),"o;f(x)+g(x);")
plot(x(1: 30: end),fmultig(1: 30: end),"v --;f(x)*g(x);")
hold off;

#13
plot(x,real(f))
title("Действительная часть");
plot(x,imag(f))
title("Мнимая часть");
plot(x,abs(f))
title("Амплитуда");
plot(x,arg(f))
title("Фаза");