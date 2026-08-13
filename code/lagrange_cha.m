function yh = lagrange_cha(x,y,xh)
    % Lagrange 插值
    % x  ：插值节点
    % y  ：节点函数值
    % xh ：待求插值点
    % yh ：插值结果

    x = x(:);
    y = y(:);
    xh = xh(:);

    n = length(x);
    yh = zeros(length(xh),1);

    for i = 1:n
        a = ones(length(xh),1);
        b = 1;

        for j = 1:n
            if i == j
                continue
            end

            a = a .* (xh - x(j));
            b = b * (x(i) - x(j));
        end

        yh = yh + y(i) * a / b;
    end
end