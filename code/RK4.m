function y = RK4(f,h,a,b,y0)

    x = a:h:b;
    n = (b-a)/h;
    y = zeros(1,n+1);
    y(1) = y0;
    for i = 2:n+1
        k1 = feval(f,x(i-1),y(i-1));
        k2 = feval(f,x(i-1)+h/2,y(i-1)+k1*h/2);
        k3 = feval(f,x(i-1)+h/2,y(i-1)+k2*h/2);
        k4 = feval(f,x(i-1)+h,y(i-1)+k3*h);
        y(i) = y(i-1) + h/6*(k1+2*k2+2*k3+k4); 
    end
    for i = 1:n+1
        disp(y(i));
    end
end