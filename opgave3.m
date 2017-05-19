clear all;
v=0.5;
N=100;
L=3;
te=5.0;
dt=0.0001;

t=0:dt:te;
dx=L/(N+1);

w=zeros(N+1,1);
w(1)=-1;

K = zeros(N+1);
for i=2:N
    K(i,i-1)=1;
    K(i,i)=-2;
    K(i,i+1)=1;
end
K(1,1)=-2;
K(1,2)=1;
K(N+1,N)=-1;
K(N+1,N+1)=2;
K=K/dx^2;


figure;
hold on;

for i=1:length(t)-1
    cla;
    w = w + dt*(v*K*w - f3(w,dx) + r3(w,v,dx));
    
    subplot(2,1,2);
    plot(dx:dx:L,w);
    title('Verandering van u als functie van dx in de tijd');
    
    subplot(2,1,1);
    plot(dx:dx:L,0.5-0.5*w);
    title('Verandering van rho als functie van dx in de tijd');
    
    pause(0.001); 
end
hold off;
