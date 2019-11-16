function v = AsymmetricalAfinParallel(h, v, k, q)

  nucleus = 3
  x = v
  gammas = asym_gammas_calculator(q);
  spmd(nucleus)
    for j = 1:q
      if labindex == s
        for s = 1:labindex
          x = NoLineal(h/labindex, Lineal(h/labindex, v, k), k);
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