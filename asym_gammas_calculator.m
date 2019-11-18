
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