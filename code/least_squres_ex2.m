function [a,b,c] = least_squres_ex2(x,y)
    x = x(:);
    y = y(:);
    n = length(x);
    m = [ones(n,1),x,-x.*y]\y;
    a = m(1); b = m(2);c = m(3);
end