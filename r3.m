function r = r3(u,v,dx)
    r=zeros(length(u),1);
    r(1)=-v/dx^2+1/(4*dx);
    r(length(u))=v*u(length(u)-1)/dx^2-u(length(u)-1)^2/(4*dx);
end
    