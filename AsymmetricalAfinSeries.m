function v = AsymmetricalAfinSeries(h, v, k, q)
  gammas = asym_gammas_calculator(q);
  Z = 0;
  for i = 1:q
    X = v;
    for j = 1:i
      X = NoLineal(h/i, Lineal(h/i, X, k), k);
    end
    Z = Z + gammas(i) .* X;
  end
  v = Z;
end

function ans = asym_gammas_calculator(q)
  M = ones(q);
  for j = 1:q
    for i = 1:q-1
      M(j,i) = i + M(j,i);
    end
  end
  
  for j = 1:q
    for i = 1:q
      M(j,i) = M(j,i).^(1-j);
    end
  end
  ans = inv(M) * [1 zeros(1, q - 1)]';
end