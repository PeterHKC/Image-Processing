function [H_mat ] = get_transformation_matrix( loc1_2D,loc2_2D )
%把loc2_2D 轉到 loc1_2D位置上
[num1_2D dim1_2D]=size(loc1_2D);
[num2_2D dim2_2D]=size(loc2_2D);
assert(dim1_2D==dim2_2D);
assert(num2_2D==num1_2D);
homogenous1_2D=[loc1_2D ones(num1_2D ,1)];
homogenous2_2D=[loc2_2D ones(num2_2D ,1)];

A_mat=zeros(num1_2D*2,(dim1_2D+1)*(dim2_2D+1));
change1=[eye(dim1_2D+1) zeros(dim1_2D+1,dim1_2D+1)];
change2=[zeros(dim1_2D+1,dim1_2D+1) eye(dim1_2D+1)];
%for迴圈為算出A矩陣
for i=1:num2_2D
    x=loc1_2D(i,1);
    change=[change1 eye(dim1_2D+1)*-x];
    data=homogenous2_2D(i,:);
    A_mat(2*i-1,:)=data*change; 
    y=loc1_2D(i,2);
    change=[change2 eye(dim1_2D+1)*-y];
    A_mat(2*i,:)=data*change; 
end
[U,S,V]=svd(A_mat);
[q,r]=eig(A_mat'*A_mat);
H_mat=reshape(V(:,end),dim2_2D+1,dim2_2D+1)';
end
