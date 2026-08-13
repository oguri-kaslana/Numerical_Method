function yh = Newton(x,y,xh)
    n = length(x);
    D = [x',y',zeros(n,n-1)];
    d = zeros(n,1);
    for i = 2:n
        dx = D(i:n,1)-D(1:n-i+1,1);
        dy = diff(D(i-1:n,i));
        D(i:n,i+1) = dy./dx;
        d(i-1) = D(i-1,i);
    end
    d(n) = D(n,n+1);
    yh = zeros(length(xh),1);
    yh = d(n-1)*(xh-x(n));
    for i = n-1:-1:1
        yh = yh.*(xh-x(i))+d(i);
    end
    
end