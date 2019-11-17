% Runge Kutta 4 para calculo de parte no lineal
function v = NoLineal(dt, v, k)

  g = -(1/2)*1i*dt*k;
  a = g.*FastFourierTransform(real(InverseFastFourierTransform(v)).^2);
  b = g.*FastFourierTransform(real(InverseFastFourierTransform(v + a/2)).^2);
  c = g.*FastFourierTransform(real(InverseFastFourierTransform(v + b/2)).^2);
  d = g.*FastFourierTransform(real(InverseFastFourierTransform(v + c)).^2);
  v = v + (a + 2*(b+c) + d)/6;

end