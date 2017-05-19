clear all;
v = 0.5;
N = 100;
L = 3;
te = 5.0;

dx = L/(N+1);
dt = dx^2/(2*v);

t = 0:dt:te;

w = zeros(N+1,1);

K = zeros(N+1);
for i = 2:N
    K(i,i-1) = 1;
    K(i,i) = -2;
    K(i,i+1) = 1;
end
K(1,1) = -2;
K(1,2) = 1;
K(N+1,N) = -1;
K(N+1,N+1) = 2;
K = K/dx^2;


figure;
hold on;
u = w;
for i = 1:length(t)-1
    cla;
    w = w + dt*(v*K*w - f3(w,dx) + r3(w,v,dx));
    u = u + (1.01)*dt*(v*K*u - f3(u,dx) + r3(u,v,dx));
    subplot(2,1,2);

    plot(dx:dx:L,0.5-0.5*u);
    title('Verandering van rho als functie van dx in de tijd (dt groot)');
    axis([0 3 1/4 1]);
    
    subplot(2,1,1);
    plot(dx:dx:L,0.5-0.5*w);
    title('Verandering van rho als functie van dx in de tijd');
    axis([0 3 1/4 1]);
    
    pause(0.001); 
end
hold off;
