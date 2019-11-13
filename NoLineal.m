% Runge Kutta 4 para calculo de parte no lineal
function v = NoLineal(dt, v, k)

  g = -(1/2)*1i*dt*k;
  a = g.*FastFourierTransform(real(ifft(v)).^2);
  b = g.*FastFourierTransform(real(ifft(v + a/2)).^2);
  c = g.*FastFourierTransform(real(ifft(v + b/2)).^2);
  d = g.*FastFourierTransform(real(ifft(v + c)).^2);
  v = v + (a + 2*(b+c) + d)/6;

end