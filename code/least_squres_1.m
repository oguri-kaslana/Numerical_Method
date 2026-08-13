function [a,b] = least_squres_1(x,y)
    x = x(:);
    y = y(:);
    n = length(x);
    m = [x,ones(n,1)]\y;
    a = m(1); b = m(2);
end