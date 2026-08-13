function y = simpson(f,a,b,n)
    % 自动加密复合 Simpson 求积
    % n 为初始 Simpson 小区间组数
    % 每次令 n = 2n，直到两次结果差小于 tol

    iter = 100;
    tol = 1e-8;

    y = simpson_fixed(f,a,b,n);

    for k = 1:iter
        y_old = y;

        n = 2*n;
        y = simpson_fixed(f,a,b,n);

        if abs(y - y_old) < tol
            break;
        end
    end
end


function y = simpson_fixed(f,a,b,n)
    h = (b-a)/(2*n);
    y = 0;

    for i = 1:n
        x1 = a + 2*(i-1)*h;
        x2 = x1 + h;
        x3 = x1 + 2*h;

        y = y + h/3 * (feval(f,x1) + 4*feval(f,x2) + feval(f,x3));
    end
end