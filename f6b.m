function [f] = f6b(u,dx)
    
    f=zeros(length(u),1);
    f(1)=u(1)^2/(4*dx); %upwindu(1)-u(0) (u(0) in rest)
    for i = 2:length(u)
        f(i) = (-u(i-1)^2 +u(i)^2)/(4*dx);% upwind u(i)^2-u(i-1)^2
    end

end