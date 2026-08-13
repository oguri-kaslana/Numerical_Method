function Jacob(A,b,x)
    n = size(A,1);
    iter = 1000;step = 1; tol = 1e-4;
    for i = 1:iter
        x_old = x;
        for j = 1:n
            x(j) = (b(j)-A(j,:)*x_old+A(j,j)*x_old(j))/A(j,j);
        end
        err = norm(x_old-x);
        if err<tol
            break;
        end
        step = step+1;
    end
    if step>=100
        disp("wrong");
    else
        disp(step);
    end

end