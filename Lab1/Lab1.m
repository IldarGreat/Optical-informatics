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
title("First quarter intervals");
plot(x(end/4:3*end/4),f(end/4:3*end/4))
xlabel("x");
ylabel("bessel(3x)");
title("Middle intervals");

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
title("Real");
plot(x,imag(f))
title("Imaginary");
plot(x,abs(f))
title("Amplitude");
plot(x,arg(f))
title("Phase");

#14
h=f.*exp(1i*x);
plot(x,real(h))
title("Real");
plot(x,imag(h))
title("Imaginary");
plot(x,abs(h))
title("Amplitude");
plot(x,arg(h))
title("Phase");

#15
F = (f.')*g;
imagesc(real(F));
g1 = g(end/4:3*end/4);
f1 = f(end/4:3*end/4);
F1 = (f1.')*g1;
imagesc(real(F1));

#16
y=x;
[X,Y] = meshgrid(x,y);
[F2,G2] = meshgrid(f,g);
G=Y.*F2+X.*G2;
imagesc(real(G));

#17
R = sqrt(X.^2 + Y.^2);
FI = atan2(Y,X);

#18
H = f.*exp(1i.*(-5).*FI);
imagesc(real(H));
title("Real");
imagesc(imag(H));
title("Imaginary");
imagesc(abs(H));
title("Amplitude");
imagesc(arg(H));
title("Phase");

#19
s = H(end/2, :1);
plot(real(s))
title("Real");
plot(imag(s))
title("Imaginary");
plot(abs(s))
title("Amplitude");
plot(arg(f))
title("Phase")