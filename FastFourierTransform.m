% Nuestra implementacion de FFT
% Adaptado de:
% https://rosettacode.org/wiki/Fast_Fourier_transform#Python:_Recursive
% https://la.mathworks.com/matlabcentral/answers/67283-need-fft-code-for-matlab-not-built-in

function z=FastFourierTransform(x)

   N=length(x);
   nfft=2^ceil(log2(N));
   z=zeros(1,nfft);
   accum=0;
   
    for k=1:nfft
       for jj=1:N
           accum=accum+x(jj)*exp(-2*pi*j*(jj-1)*(k-1)/nfft);
       end
    z(k)=accum;
    accum=0;% Reset
  end
  
return
