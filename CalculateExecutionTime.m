function s = CalculateExecutionTime(initialTime, finalTime)

  [hi,mi,si] = hms(initialTime);
  [hf,mf,sf] = hms(finalTime);   
  
   mi = (hi * 60) + mi;
   si = (mi * 60) + si;
    
   mf = (hf * 60) + mf;
   sf = (mf * 60) + sf;
    
   s = sf - si;
   return
   
end

