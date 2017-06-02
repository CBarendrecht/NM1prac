clear all;
v = 0.01;
N = 100;
L = 3;
te = 5.0;

dx = L/(N+1);
dt = 0.003;

t = 0:dt:te;

w = zeros(N+1,1);
for j = 1:N+1
    if j*dx <= L/3 
        w(j)= 1;
    elseif j*dx <= 2*L/3
        w(j) = 2-j*dx*3/L;
    end
end

K = zeros(N+1);
for i = 2:N
    K(i,i-1) = 1;
    K(i,i) = -2;
    K(i,i+1) = 1;
end
K(1,1) = -2;
K(1,2) = 1;
K(N+1,N) = 1;
K(N+1,N+1) = -2;
K = K/dx^2;


figure;
hold on;
Autos=zeros(length(t),1);

for i = 1:length(t)-1
    cla;
    w = w + dt*(v*K*w - f6b(w,dx) + r6b(w,v,dx));
    p=0.5-0.5*w; %dichteid
    
    %subplot(2,1,2);
    %plot(dx:dx:L,w);
    %title('Verandering van u als functie van dx in de tijd');
    %axis([0 3 -2 1]);
    
    %subplot(2,1,1);
    plot(dx:dx:L,p);
    title('Verandering van rho als functie van dx in de tijd');
    axis([0 3 -0.1 0.75]);
    
    pause(0.001);     
    Autos(i) = (dx/2)*(p(1)+p(length(p)) +2*sum(p(2:length(p)-1)));
    %disp(num2str(Autos));
    if Autos(i) < 0.001
        disp(['De weg is leeg op t = ' num2str(t(i))]);
        break;
    end
end
hold off;
figure;
plot(t,1000*Autos);
title('Het aantal autos op de weg als functie van de tijd');
axis([0 3 0 750]);
