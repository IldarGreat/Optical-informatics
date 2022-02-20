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
f = besselj(3,3*x);

#6
plot(x,f)
xlabel("x");
ylabel("bessel(x)");

#7
f = besselj(3,6*x);
plot(x,f)
xlabel("x");
ylabel("bessel(x)");
f = besselj(3,3*(x+5));
plot(x,f)
xlabel("x");
ylabel("bessel(x)");
f = besselj(3,3*x);

#8
plot(x(1:end/4),f(1:end/4))
xlabel("x/4");
ylabel("bessel(x)/4");
title("Первая четверть интервалов");
plot(x(end/4:3*end/4),f(end/4:3*end/4))
xlabel("3*x/4");
ylabel("3*bessel(x)/4");
title("Середина графика");

#9
domain = x > 0 & x < 7
plot(x(domain),f(domain));
xlabel("x(domain)");
ylabel("bessel");