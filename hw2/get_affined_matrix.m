function [result A B]= get_affined_matrix(im2_loc, im1_loc)
    [dim two] = size(im2_loc);
    
    B = zeros(dim*2,1);
    A = zeros(dim*2,6);
    for i=1:2:dim*2
       A(i,:)=[im1_loc((i+1)/2,:) 1 0 0 0];
       A(i+1,:)=[0 0 0 im1_loc((i+1)/2,:) 1];
       B(i,:)=im2_loc((i+1)/2,1);
       B(i+1,:)=im2_loc((i+1)/2,2);
    end
    M = A\B;
    result = zeros(2,3);
    result(1,:) = M(1:3);
    result(2,:) = M(4:6);
    result(3,:) = [0 0 1];
end