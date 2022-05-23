#4
n = 1000;

#5
R = 5;
h_r = R / n;
r = 0:h_r:R - h_r;

#6
r1 = 0.5;
r2 = 2;
r3 = 3;
r4 = 4.6;
h1 = 1.5;
h2 = 1;
f = func(r, r1, r2).*h1 + func(r, r3, r4).*h2;

#7
#{
figure(1);
plot(r, abs(f));
title("Amplitude");
figure(2);
plot(r, arg(f));
title("Phase");
#}

#8
m = -2;
[j,k] = meshgrid(1:2*n-1,1:2*n-1);
alpha = round(sqrt((j - n).^2 + (k - n).^2)) + 1;
circ_a = (alpha <= n)*1;
alpha(alpha > n) = 0;
phi = exp(i*m*atan2(k - n, j - n));
A = zeros(2*n - 1);
A(circ_a == 1) = f(alpha(circ_a == 1));
A = A.*phi;

#{
imagesc(arg(A));
colormap jet;
colorbar;
#}

#{
imagesc(abs(A));
colormap jet;
colorbar;
#}

#9
P = 5;
h_p = P/n;
ro = 0:h_p:P - h_p;
K = besselj(m, 2*pi*ro'*r).*r;

#10
F = (K*f')*(h_r*(2*pi / i^m));

#11
#{
figure(1)
plot(r, abs(F))
title("Амплитуда");

figure(2)
plot(r, arg(F))
title("Фаза");
#}

#12
A1 = zeros(2*n - 1);
A1(circ_a == 1) = F(alpha(circ_a == 1));
A1 = A1.*phi;

#{
figure(1)
imagesc(abs(A1));
colormap jet;
colorbar;

figure(2)
imagesc(arg(A1));
colormap jet;
colorbar;
#}