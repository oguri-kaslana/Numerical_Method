function y = Euler(f,h,a,b,y0)
    x = a:h:b;
    n = (b-a)/h;
    y = zeros(1,n+1);
    y(1) = y0;
    for i = 2:n+1
        y(i) = y(i-1) + h*feval(f,x(i-1),y(i-1)); 
    end
    for i = 1:n+1
        disp(y(i));
    end
end