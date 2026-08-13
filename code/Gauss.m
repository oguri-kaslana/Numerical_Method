function y = Gauss(f,a,b)
    m = [-1,1;1,1];
    n = m\[a;b];
    J = (b-a)/2;
    p = @(t) n(1)*t+n(2);
    w = 1/9*[5,8,5];
    xp = 1/5*[-sqrt(15),0,sqrt(15)];
    y = 0;
    for i = 1:3
        y = y+w(i)*feval(f,(feval(p,xp(i))));
    end
    y = J*y;
end