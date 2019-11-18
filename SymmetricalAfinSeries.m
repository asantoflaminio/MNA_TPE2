%Afin simetrico version en serie

function v = SymmetricalAfinSeries(h, v, k, q)
  
  Z = 0;
  n = q/2;
  
  gammas = sym_gammas_calculator(q);
  
  for i = 1:n
    X = v; Y = v;
    for j = 1:i
      X = NoLineal(h/i, Lineal(h/i, X, k), k); Y = Lineal(h/i, NoLineal(h/i, Y, k), k);
    end
    Z = Z + gammas(i) .* X + gammas(i) .* Y;
  end
  
  v = Z;

end

