% Nuestra implementacion de FFT
% Adaptado de:
% https://rosettacode.org/wiki/Fast_Fourier_transform#Python:_Recursive
% https://la.mathworks.com/matlabcentral/answers/67283-need-fft-code-for-matlab-not-built-in

function z=FastFourierTransform(x)
  N=length(x);
  if N <= 1
    z = x;
  else
    odd = FastFourierTransform(x(1:2:N-1));
    even = FastFourierTransform(x(2:2:N));
    n = floor(N/2);
    T = zeros(1,n);
    for k=1:n
      T(k) = exp(-2j*pi*k/N)*odd(k);
    end
    a = zeros(1,n);
    b = zeros(1,n);
    for k=1:n
      a(k) = even(k) + T(k);
      b(k) = even(k) - T(k);
    end
    z = a + b;
  end
return