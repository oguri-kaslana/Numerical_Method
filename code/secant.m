function xh = secant(f,x)
    iter = 100; tol = 1e-6; step = 1;
    x1 = x(1);
    x2 = x(2);
    for i = 1:iter
        err = abs(x2-x1);
        if err<tol
            break;
        end
        df = (feval(f,x2)-feval(f,x1))/(x2-x1);
        x1 = x2;
        x2 = x2-feval(f,x2)/df;
        step =step+1;
    end
    xh = x2;
    disp(step);disp(xh);
end