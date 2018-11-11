function yy=spline3(xi,yi,xx)
    n=length(xi);
    h=xi(2)-xi(1); 
    F=zeros(n,1); 
    for k=2:n-1
        F(k,1)=6./h.^2.*(yi(k+1)-2.*yi(k)+yi(k-1));
    end
    z=tri(F);
    z(end+1)=0;
    C=zeros(n+1,1);
    for k=1:n
        C(k,1)=yi(k)-(h.^2./6).*z(k);
    end
    
    for x=1:length(xx)
        w=(xx(x)-xi(1))./h;
        k=floor(w);
        u=w-k;
        yy(x)=(h.^2/6).*z(k+2).*u.^3+(h.^2/6).*z(k+1).*(1-u).^3+C(k+2).*u+C(k+1).*(1-u);
    end
end