%Afin simetrico version en paralelo

function v = SymmetricalAfinParallel(h, v, k, q)

  x = v;
  n = floor(q/2);
  
  gammas = sym_gammas_calculator(q);
  
  spmd(q) 
    
    for j = 1:n
      if labindex == j % en vez de j era s
        for s = 1:labindex
          x = NoLineal(h/labindex, Lineal(h/labindex, x, k), k);
        end
        x = gammas(labindex) .* x; % esto en realidad estaba fuera del if y sin el '.'
      end
      if labindex == j + n  % en vez de j era s
         for s = 1:labindex-n 
             x= NoLineal(h/(labindex-n), Lineal(h/(labindex-n), x, k), k);
         end
         x = gammas(labindex-n) .* x; % esto en realidad estaba fuera del if y sin el '.'
      end
    end
    
  end %cierro spmd
  
  for s = 2:q 
    x{1} = x{1}+x{s};
  end

  v = x{1};

  end