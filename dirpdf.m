function z = dirpdf(x, a)

    [m,n] = size(x);
    if (n ~= size(a,2))
        error('size mismatch');
    end
    
    beta = prod(gamma(a))/gamma(sum(a));
    
    z = zeros([m,1]);
    for j=1:m
        z(j) = 1/beta * prod(x(j,:).^(a-1));
    end
    
end