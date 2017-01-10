function [result]= stitch_M8(img, M, bb)
    bb_xmin = bb(1);
    bb_xmax = bb(2);
    bb_ymin = bb(3);
    bb_ymax = bb(4);

    [U,V] = meshgrid(bb_xmin:bb_xmax,bb_ymin:bb_ymax);
    [nrows, ncols] = size(U);

    u = U(:);
    v = V(:);
    x1 = M(1,1)*u + M(1,2)*v + M(1,3);
    y1 = M(2,1)*u + M(2,2)*v + M(2,3);
    w1 = 1./(M(3,1) * u + M(3,2) * v + M(3,3));
    U(:) = x1.*w1;
    V(:) = y1.*w1;
    
    result = uint8([]);
    result(nrows, ncols, 3) = 1;

    result(:,:,1) = interpolation(img(:,:,1),U,V);
    result(:,:,2) = interpolation(img(:,:,2),U,V);
    result(:,:,3) = interpolation(img(:,:,3),U,V);
end
