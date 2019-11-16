function v = AsymmetricalAfinParallel(h, v, k, q)

  nucleus = 3;
  x = v;
  gammas = asym_gammas_calculator(q);
  spmd(nucleus)
    for j = 1:q
      if labindex == s
        for s = 1:labindex
          x = NoLineal(h/labindex, Lineal(h/labindex, x, k), k);
        end
      end
      x = gammas(labindex) * x;
    end
  end
  
  for s = 2:q
    x{1} = x{1}+x{s};
  end

  v = x{1};
end

