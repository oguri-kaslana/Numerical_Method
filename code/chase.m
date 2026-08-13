function x = chase(L,D,U,b)
    % 追赶法求解三对角线性方程组 Ax = b
    % L：下对角线，L(1)=0
    % D：主对角线
    % U：上对角线，U(n)=0
    % b：右端项

    L = L(:);
    D = D(:);
    U = U(:);
    b = b(:);

    n = length(D);

    d = zeros(n,1);   % 分解后 U 矩阵的主对角线
    l = zeros(n,1);   % 分解后 L 矩阵的下对角线
    y = zeros(n,1);
    x = zeros(n,1);

    % 第一步
    d(1) = D(1);

    % 向前追
    for i = 2:n
        l(i) = L(i) / d(i-1);
        d(i) = D(i) - l(i) * U(i-1);
    end

    % 前代求 Ly = b
    y(1) = b(1);

    for i = 2:n
        y(i) = b(i) - l(i) * y(i-1);
    end

    % 回代求 Ux = y
    x(n) = y(n) / d(n);

    for i = n-1:-1:1
        x(i) = (y(i) - U(i) * x(i+1)) / d(i);
    end
end