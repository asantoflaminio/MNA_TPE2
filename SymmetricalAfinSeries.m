%Afin simetrico version en serie

function v = SymmetricalAfinSeries(h, v, k, q)

  gammas = sym_gammas_calculator(q);
  Z = 0;
  n = q/2;
  for i = 1:n
    X = v;
    Y = v;
    for j = 1:i
      X = NoLineal(h/i, Lineal(h/i, X, k), k);
      Y = Lineal(h/i, NoLineal(h/i, Y, k), k);
    end
    Z = Z + gammas(i) .* X + gammas(i) .* Y;
  end
  v = Z;
end

function ans = sym_gammas_calculator(q)
  n = q/2;
  M = ones(n);
  for j = 1:n
    for i = 1:n-1
      M(j,i) = i + M(j,i);
    end
  end
  for j = 1:n
    for i = 1:n
      M(j,i) = M(j,i).^(1-j);
    end
  end
  ans = inv(M) * [1/2 zeros(1, n - 1)]';
end