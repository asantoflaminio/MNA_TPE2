% Nuestra implementacion de FFT
% Adaptado de:
% https://rosettacode.org/wiki/Fast_Fourier_transform#Python:_Recursive
% https://la.mathworks.com/matlabcentral/answers/67283-need-fft-code-for-matlab-not-built-in

function z=FastFourierTransform(x)
  N=length(x);
  if N <= 1
    z = x;
  else
    range = (0:N/2-1);
    e = exp(-2i*pi/N).^range;
    odd = FastFourierTransform(x(1:2:N-1));
    even = e.*FastFourierTransform(x(2:2:N));
    z = [even + odd, even - odd];
  end
return
