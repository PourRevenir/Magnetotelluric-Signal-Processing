function [f,X] = time2frequency(x,fs)
    n = length(x);
    X = fft(x);
    f = (0:n/2-1)*(fs/n);
    X = X(1:n/2)/(n/2);
end