function r = r6b(u,v,dx)
    r=zeros(length(u),1);
    r(1)=v/dx^2+1/(2*dx); %v van centraal, 1/4dx van u_0 upwind 
    r(length(u))=v*u(length(u)-1)/dx^2; % v van centraal, geen rest van upwind
end
    