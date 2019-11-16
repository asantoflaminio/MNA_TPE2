% kursiv.m - solution of Kuramoto-Sivashinsky equation by ETDRK4 scheme
%
% u_t = -u*u_x - u_xx - u_xxxx, periodic BCs on [0,32*pi]
% computation is based on v = fft(u), so linear term is diagonal
% compare p27.m in Trefethen, "Spectral Methods in MATLAB", SIAM 2000
% AK Kassam and LN Trefethen, July 2002

% Spatial grid and initial condition:
N = 128;
x = 32*pi*(1:N)'/N;
h = 1/4; % time step
k = [0:N/2-1 0 -N/2+1:-1]'/16; % wave numbers

%perturbacion inicial
%pert = 0;  
pert = x * (rand * 0.01 - 0.005);  
% x = pert + x; % esto es para agregar la perturbacion
u = cos(x/16).*(1+sin(x/16));
v = FastFourierTransform(u);


% Main time-stepping loop:
uu = u; tt = 0;
tmax = 150; nmax = round(tmax/h); nplt = floor((tmax/100)/h);
%g = -0.5i*k;

% ORDEN
q = 4;

for n = 1:nmax
  t = n*h;
  
    % LIE TROTTER
    v = NoLineal(h, Lineal(h, v, k), k);
    
    %AFIN simetrico en serie
    % v = SymmetricalAfinSeries(h, v, k, q);
    
    %AFIN simetrico en paralelo
    %v = SymmetricalAfinParallel(h, v, k, q);
    
    % AFIN Asimetrico en serie
    % v = AsymmetricalAfinSeries(h, v, k, q);
    
    % AFIN Asimetrico en paralelo
    % v = AsymmetricalAfinParallel(h, v, k, q);
  
  if mod(n,nplt)==0
    u = real(ifft(v));
    uu = [uu,u]; tt = [tt,t];
  end
end

% Plot results:
surf(tt,x,uu), shading interp, lighting phong, axis tight
view([-90 90]), colormap(autumn); set(gca,'zlim',[-5 50])
light('color',[1 1 0],'position',[-1,2,2])
material([0.30 0.60 0.60 40.00 1.00]);
