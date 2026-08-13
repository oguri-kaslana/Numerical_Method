function y = Euler_improved(f,h,a,b,y0)
    x = a:h:b;
    n = (b-a)/h;
    y = zeros(1,n+1);
    y(1) = y0;
    for i = 2:n+1
        yh = y(i-1)+h*feval(f,x(i-1),y(i-1));
        y(i) = y(i-1) + h/2*(feval(f,x(i-1),y(i-1))+feval(f,x(i),yh)); 
    end
    for i = 1:n+1
        disp(y(i));
    end
end