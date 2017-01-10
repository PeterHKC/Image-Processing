function gasim = gaussianNoise(im, amp)
    amp = sqrt(amp);
    [h w] = size(im);
    gasim = zeros(h,w);
    iset = 0;
    gset = 0;
    for i = 1:h
        for j=1:w
            [result, newiset, newgset] = gasdev(iset,gset);
            gasim(i,j) = result*amp + im(i,j);
            iset = newiset;
            gset = newgset;
        end
    end
    
end