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
