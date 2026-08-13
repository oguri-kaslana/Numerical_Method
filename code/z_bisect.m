function  xh = bisect(f,a,b)
    iter = 100; tol = 1e-6; step = 1;
    for i = 1:iter
        temp = (a+b)/2;
        judge = feval(f,a)*feval(f,temp);
        if judge<0
            b = temp;
        else
            a = temp;
        end
        xh = (b+a)/2;
        err = abs(feval(f,xh));
        if err<tol
            break;
        end
        step = step+1;

    end
    disp(step);disp(xh);

end