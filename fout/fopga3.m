function [f] = fopga3(u,dx)
    
    f=zeros(1,length(u));
    for i = 2:length(u)-1
        f(i) = (-u(i-1)^2 +u(i+1)^2)/(4*dx);
    end
end