function result = adptiveLocal(image)
    im = image;
    image = double(image);
    [h, w] = size(im);
    
    im = [im(1,:); im; im(h,:)];
    im = [im(:,1) im im(:,w)];
    
    [nrows, ncols] = size(im);
    
    local_mean = zeros(h, w);
    local_variance = zeros(h, w);
    
    for i = 1:nrows-2
        for j = 1:ncols-2
            window = [im(i,j) im(i,j+1) im(i,j+2) im(i+1) im(i+1,j+1) im(i+1,j+2) im(i+2,j) im(i+2,j+1) im(i+2,j+2)];
            local_mean(i, j) = mean(window);
            local_variance(i, j) = mean(window.*window)-mean(window)*mean(window);
        end
    end
    noise_variance = sum(local_variance(:))/(h*w);
    local_variance = max(local_variance, noise_variance);
    result = image - (noise_variance./local_variance).*(image-local_mean);
end