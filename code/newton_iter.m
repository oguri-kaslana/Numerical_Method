function xh = newton_iter(f,df,x)
    iter = 100; tol = 1e-6; step = 1;
    x = x(:);
    for i = 1:iter
        x_old = x;
        x = x-feval(df,x)\feval(f,x);
        err = norm(x-x_old);
        if err<tol
            break;
        end
        step =step+1;
    end
    xh = x;
    disp(step);disp(xh);
end