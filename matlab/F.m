function dx = F(T, X, p, r, s,q);

    dx = zeros(3,1);
    dx(1) = -X(1) - X(2);
    dx(2) = -p*X(3)+r*X(2) + X(3)*X(3)*(s-X(2));
    dx(3) = -q*(X(1)+X(3));
end