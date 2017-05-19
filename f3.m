function [f] = f3(u,dx)
    
    f=zeros(length(u),1);
    f(1)=u(2)^2/(4*dx);
    for i = 2:length(u)-1
        f(i) = (-u(i-1)^2 +u(i+1)^2)/(4*dx);
    end
    f(length(u))=-u(length(u)-1)^2/(4*dx);
end