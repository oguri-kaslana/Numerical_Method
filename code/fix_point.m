function xh = fix_point(g,x)
    iter = 100; tol = 1e-6; step = 1;
    for i = 1:iter
        x_old = x;
        x = feval(g,x);
        err = abs(x-x_old);
        if err<tol
            break;
        end
        step =step+1;
    end
    xh = x;
    disp(step);disp(xh);
end