function result = laplacian(im)
    laplacian_Filter = [-1 -1 -1;
                        -1 8 -1;
                        -1 -1 -1];
    [h, w] = size(im);
    
    im = [im(1,:); im; im(h,:)];
    im = [im(:,1) im im(:,w)];
    
    [nrows, ncols] = size(im);
    result = zeros(h, w);
    
    for i = 1:nrows-2
        for j = 1:ncols-2
            tempMatrix = [im(i,j) im(i,j+1) im(i,j+2);
                          im(i+1) im(i+1,j+1) im(i+1,j+2);
                          im(i+2,j) im(i+2,j+1) im(i+2,j+2);];
            result(i,j) = sum(sum(double(tempMatrix).*laplacian_Filter));
        end
    end
end