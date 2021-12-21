function ifim = invfft(him)
[M2, N2] = size(him);
wM2 = zeros(M2, M2);
wN2 = zeros(N2, N2);
for x2 = 0 : (M2 - 1)
	for u2 = 0 : (M2 - 1)
		wM2(x2+1,u2+1) = exp(2 * pi * 1i / M2 * x2 * u2);
	end
end
for y2 = 0 : (N2 - 1)
	for v2 = 0 : (N2 - 1)
		wN2( v2+1,y2+1) = exp(2 * pi * 1i / N2 * y2 * v2);
	end
end
ifim = wM2 / M2 * im2double(him) * wN2 / N2;
