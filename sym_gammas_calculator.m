function ans = sym_gammas_calculator(q)
  
  n = floor(q/2);
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