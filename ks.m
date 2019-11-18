% Basado en kursiv.m del paper de
% AK Kassam y LN Trefethen

initialTime = datetime('now');

% Spatial grid and initial condition:
N = 128;
x = 32*pi*(1:N)'/N;
h = 0.25; % time step
k = [0:N/2-1 0 -N/2+1:-1]'/16; % wave numbers

%perturbacion inicial
pert = 0;  
%pert = x * (rand * 0.01 - 0.005);  %Para activar perturbaciones
%descomentar esto
x = pert + x; % esto es para agregar la perturbacion

% Condicion inicial!
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
    % v = NoLineal(h, Lineal(h, v, k), k);
    
    % Strang
    %v = Lineal(h/2, NoLineal(h, Lineal(h/2, v, k), k), k);
    
    %AFIN simetrico en serie
    v = SymmetricalAfinSeries(h, v, k, q);
    
    %AFIN simetrico en paralelo
    %v = SymmetricalAfinParallel(h, v, k, q);
    
    % AFIN Asimetrico en serie
    %v = AsymmetricalAfinSeries(h, v, k, q);
    
    % AFIN Asimetrico en paralelo
    %v = AsymmetricalAfinParallel(h, v, k, q);
  
  if mod(n,nplt)==0
    u = real(ifft(v));
    uu = [uu,u]; tt = [tt,t];
  end
  
end

finalTime = datetime('now');

% Calculate SpeedUp
speedUp = CalculateSpeedUp(initialTime, finalTime);

% Plot results:
surf(tt,x,uu), shading interp, lighting phong, axis tight
view([-90 90]), colormap(autumn); set(gca,'zlim',[-5 50])
light('color',[1 1 0],'position',[-1,2,2])
material([0.30 0.60 0.60 40.00 1.00]);

%imprimo speed up
speedUp
