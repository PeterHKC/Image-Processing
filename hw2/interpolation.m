function result = interpolation(im, u, v)
    [h w] = size(im);
    [nrows, ncols] = size(u);
    result = zeros(nrows, ncols);
    
    
    for i=1:nrows
        for j=1:ncols
            if (u(i,j)>=1) & (v(i,j)>=2) & (u(i,j)<w) & (v(i,j)<h-1)
                x = ceil(v(i,j));
                y = floor(u(i,j));
                a = v(i,j)-x;
                b = u(i,j)-y;
                
                result(i,j) = (1-a)*(1-b)*im(x,y)+a*(1-b)*im(x+1,y)+b*(1-a)*im(x+1,y)+a*b*im(x+1,y+1);
            end
        end
    end
end