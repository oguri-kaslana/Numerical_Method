function y = trapeze_method(f,h,a,b,y0)
    x = a:h:b;
    n = (b-a)/h;

    y = zeros(1,n+1);
    y(1) = y0;

    tol = 1e-8;
    iter = 100;

    for i = 2:n+1
        % 先用 Euler 法给 y_i 一个初值
        y_new = y(i-1) + h*feval(f,x(i-1),y(i-1));

        % 用固定点迭代求隐式梯形法中的 y_i
        for k = 1:iter
            y_old = y_new;

            y_new = y(i-1) + h/2 * ...
                (feval(f,x(i-1),y(i-1)) + feval(f,x(i),y_old));

            if abs(y_new-y_old) < tol
                break;
            end
        end

        y(i) = y_new;
    end

    for i = 1:n
        disp(y(i));
    end
end