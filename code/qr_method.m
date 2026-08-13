function lamuda = qr_method(A,v)
    tol = 1e-6;iter = 100; step = 1;
    for i = 1:iter
        [q,r] = qr(A);
        B = r*q;
        err = norm(diag(A)-diag(B));
        if err<tol
            break;
        end
        A = B;
        step = step+1;
    end
    lamuda = diag(B);
    disp(lamuda);
end