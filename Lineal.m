function v = Lineal(dt, v, k)
  
  v = v.*exp((k.^2 - k.^4)*dt);
  
end