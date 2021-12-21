% simple implementation of frequency domain filters
%read input image
dim=imread('rock.bmp');
cim=double(dim);
[r,c]=size(cim);
r1=2*r;
c1=2*c;
pim=zeros((r1),(c1));
kim=zeros((r1),(c1));
%padding
for i=1:r
    for j=1:c
   pim(i,j)=cim(i,j);
    end
end
%center the transform
for i=1:r
    for j=1:c
   kim(i,j)=pim(i,j)*((-1)^(i+j));
    end
end
%2D fft function
fim=fftrans(kim);

n=1; %order for butterworth filter
thresh=10; % cutoff radius in frequency domain for filters

himl=blpf(fim,thresh,n); % butterworth low pass filter
himh=bhp(fim,thresh,n);  % butterworth high pass filter
%inverse 2D fft
ifiml=invfft(himl);
ifimh=invfft(himh);

for i=1:r1
    for j=1:c1
        ifiml(i,j)=ifiml(i,j)*((-1)^(i+j));
        ifimh(i,j)=ifimh(i,j)*((-1)^(i+j));
    end
end
% removing the padding
for i=1:r
    for j=1:c
        riml(i,j)=ifiml(i,j);
        rimh(i,j)=ifimh(i,j);
    end
end
% retaining the real parts of the matrix
riml=real(riml);
riml=uint8(riml);
rimh=real(rimh);
rimh=uint8(rimh);
subplot(1,3,1), imshow(dim);title('Original');
subplot(1,3,2), imshow(riml);title('Low Pass');
subplot(1,3,3), imshow(rimh);title('High Pass');
%title("Image Enhancement in Frequency Domain using Butterworth Filters:");
