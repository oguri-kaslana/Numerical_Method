function lamuda = shift_power_method(A,v,p)
    iter = 100; tol = 1e-6; step = 1;
    [~,index] = max(abs(v));
    u = v/v(index);
    A = A-p*eye(size(A));
    for i = 1:iter
        m = max(abs(v));
        v = A\u;
        [~,index] = max(abs(v));
        lamuda = v(index);
        u = v/lamuda;
        err = abs(abs(lamuda)-m);
        if err<tol
            break;
        end
        step = step+1;
    end
    disp(step);disp(p+1/lamuda);