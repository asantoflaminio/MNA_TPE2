% Nuestra implementacion de FFT
% Adaptado de:
% https://rosettacode.org/wiki/Fast_Fourier_transform#Python:_Recursive
% https://la.mathworks.com/matlabcentral/answers/67283-need-fft-code-for-matlab-not-built-in

function z=FastFourierTransform(x)
  N=length(x);
  if N <= 1
    z = x';
  else
    n = floor(N/2);
    range = (0:n-1);
    e = exp(-2j*pi/N).^range;
    even = FastFourierTransform(x(1:2:N)).';
    odd = FastFourierTransform(x(2:2:N)).';
    T = e.*odd;
    z = [even + T, even - T].';
  end
return
