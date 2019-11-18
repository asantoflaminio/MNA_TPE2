function y = main
  % Basado en kursiv.m del paper de
  % AK Kassam y LN Trefethen
  method = 1;
  
  r = display_method(method);
  
  if r == -1
    disp("Terminando ejecuci�n");
    return
  end
  
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
    
    if method == 1
        v = NoLineal(h, Lineal(h, v, k), k);
    elseif method == 2
        v = Lineal(h/2, NoLineal(h, Lineal(h/2, v, k), k), k);
    elseif method == 3
        v = SymmetricalAfinSeries(h, v, k, q);
    elseif method == 4
        v = SymmetricalAfinParallel(h, v, k, q);
    elseif method == 5
        v = AsymmetricalAfinSeries(h, v, k, q);
    elseif method == 6
        v = AsymmetricalAfinParallel(h, v, k, q);
    end
    
    if mod(n,nplt)==0
      u = real(ifft(v));
      uu = [uu,u]; tt = [tt,t];
    end
    
  end

  finalTime = datetime('now');

  % Calculate Execution Time
  executionTime = CalculateExecutionTime(initialTime, finalTime);

  % Plot results:
  surf(tt,x,uu), shading interp, lighting phong, axis tight
  view([-90 90]), colormap(autumn); set(gca,'zlim',[-5 50])
  light('color',[1 1 0],'position',[-1,2,2])
  material([0.30 0.60 0.60 40.00 1.00]);

  %Imprimo Execution Time
  executionTime
end

function y = display_method(method)
    y = 1;
    
    if method == 1
          disp("M�todo elegido: Lie Trotter.");
    elseif method == 2
          disp("M�todo elegido: Strang.");
    elseif method == 3
          disp("M�todo elegido: Afin Sim�trico en Serie.");
    elseif method == 4
          disp("M�todo elegido: Afin Sim�trico en Paralelo.");
    elseif method == 5
          disp("M�todo elegido: Afin Asim�trico en Serie.");
    elseif method == 6
          disp("M�todo elegido: Afin Asim�trico en Paralelo.");
    else
          disp("ERROR. El metodo ingresado no existe.");
          y = -1;
    end
end
    

