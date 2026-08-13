function I = romberg(f,a,b)
    tol = 1e-4;iter = 100;
    R = zeros(iter,iter);
    n = 1; h = b-a;
    R(1,1) = h/2*(feval(f,a)+feval(f,b));
    for i = 2: iter
        count = (b-a)/h;
        n = 2*n;
        h = (b-a)/n;
        delta = 0;
        for j = 1:count
            xm = a + (2*j-1)*h;
            delta = delta + feval(f,xm);
        end
        R(i,1) = 1/2*R(i-1,1) + h*delta;
        for k = 2:i
            R(i,k) = R(i,k-1) + (R(i,k-1) - R(i-1,k-1)) / (4^(k-1) - 1);
        end
        err = abs(R(i-1,i-1)-R(i,i));
        if err<tol
            I=R(i,i);
            break;
        end
    end
end