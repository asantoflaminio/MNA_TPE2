function v = AsymmetricalAfinParallel(h, v, k, q)

  %nucleus = 4;
  x = v;
  gammas = asym_gammas_calculator(q);
  spmd(q) % en vez de q era nucleus
    for j = 1:q   
        if labindex == j % en vez de j era s, pero no tenia sentido
            for s = 1:labindex
              x = NoLineal(h/labindex, Lineal(h/labindex, x, k), k);
            end
            x = gammas(labindex) .* x; % esto en realidad estaba fuera del if
        end
    end
  end
 
  for s = 2:q % en realidad era q
    x{1} = x{1}+x{s};
  end
  v = x{1};
  
end

