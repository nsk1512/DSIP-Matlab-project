function fim = fftrans(kim)
[M1, N1] = size(kim);
wM1 = zeros(M1, M1);
wN1 = zeros(N1, N1);
for u1 = 0 : (M1 - 1)    
    for x1 = 0 : (M1 - 1)        
        wM1(u1+1, x1+1) = exp(-2 * pi * 1i / M1 * x1 * u1);    
    end    
end 
for v1 = 0 : (N1 - 1)    
    for y1 = 0 : (N1 - 1)        
        wN1(y1+1, v1+1) = exp(-2 * pi * 1i / N1 * y1 * v1);    
    end    
end 
fim = wM1 * im2double(kim) * wN1;
