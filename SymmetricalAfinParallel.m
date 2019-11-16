%Afin simetrico version en paralelo

function v = SymmetricalAfinParallel(h, v, k, q)

  % a chequear
  % en paper usa q en vez de nucleus
  nucleus = 3;
  x = v;
  n = q/2;
  gammas = sym_gammas_calculator(q);
  spmd(nucleus)
    for j = 1:n
      for s = 1:labindex
        if labindex == s
          x= NoLineal(h/labindex, Lineal(h/labindex, x, k), k);
        end
      end
      x = gammas(labindex) * x;
    end
  
  for s = 2:n
    x{1} = x{1}+x{s};
  end

  v = x{1};

  end