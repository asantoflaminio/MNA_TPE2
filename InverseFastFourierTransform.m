% Base teorica
% https://adamsiembida.com/how-to-compute-the-ifft-using-only-the-forward-fft/

function z=InverseFastFourierTransform(x)
  z = (FastFourierTransform(x')')'/length(x);
return
