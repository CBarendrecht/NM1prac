function r = r3(u,v,dx)
    r=zeros(1,length(u));
    r(1)=v*(2*u(1)-u(2))/dx^2;
    r(length(u))=v*(2*u(length(u))-u(length(u)-1))/dx^2;
end
    