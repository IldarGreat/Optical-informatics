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
#{
#6
figure(1);
plot(x,f)
xlabel("x");
ylabel("bessel(3x)");

#7
f = besselj(1,2*(3*x));
figure(2);
plot(2*x,f)
xlabel("x");
ylabel("bessel(6x)");
f = besselj(1,3*(x+5));
figure(3);
plot(x+5,f)
xlabel("x");
ylabel("bessel(3(x+5))");
f = besselj(1,3*x);

#8
figure(4);
plot(x(1:end/4),f(1:end/4))
xlabel("x");
ylabel("bessel(3x)");
title("First quarter intervals");
figure(5);
plot(x(end/4:3*end/4),f(end/4:3*end/4))
xlabel("x");
ylabel("bessel(3x)");
title("Middle intervals");

#9
domain = x > 0 & x < 7;
figure(6);
plot(x(domain),f(domain));
xlabel("x(domain)");
ylabel("bessel(3x)");
#}
#10
g = cos(x);

#11
fplusg = f.+g;
fmultig = f.*g;
#{
#12
figure(7);
plot(x,f,"-;f(x);")
hold on;
plot(x,g,"-.;g(x);")
plot(x(1: 30: end),fplusg(1: 30: end),"o;f(x)+g(x);")
plot(x(1: 30: end),fmultig(1: 30: end),"v—;f(x)*g(x);")
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
#}
#14
h=f.*exp(1i*x);
figure(1);
plot(x,real(h))
title("Real");
figure(2);
plot(x,imag(h))
title("Imaginary");
figure(3);
plot(x,abs(h))
title("Amplitude");
figure(4);
plot(x,arg(h))
title("Phase");

#15
F = (g.')*f;
figure(10);
imagesc(real(F));
g1 = g(end/4:3*end/4);
f1 = f(end/4:3*end/4);
F1 = (f1.')*g1;
figure(11);
imagesc(real(F1));

#16
y=x;
[X,Y] = meshgrid(x,y);
[F2,G2] = meshgrid(f,g);
G=Y.*F2+X.*G2;
figure(12);
imagesc(real(G));

#17
R = sqrt(X.^2 + Y.^2);
FI = atan2(Y,X);

#18
f1 = besselj(1,3*R);
H = f1.*exp(1i.*(-5).*FI);
figure(13);
imagesc(real(H));
title("Real");
figure(14);
imagesc(imag(H));
title("Imaginary");
figure(15);
imagesc(abs(H));
title("Amplitude");
figure(16);
imagesc(arg(H));
title("Phase");

#19
s = H(end/2, :);
figure(5);
plot(real(s))
title("Real");
figure(6);
plot(imag(s))
title("Imaginary");
figure(7);
plot(abs(s))
title("Amplitude");
figure(8);
plot(arg(f))
title("Phase")
