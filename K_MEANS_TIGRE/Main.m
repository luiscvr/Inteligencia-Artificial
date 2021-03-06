I1=imread('atardecer.jpg');
s=size(I1);
I=zeros(s(1), s(2), 3);
% Convertir la imagen a modo matriz 3D
I(:,:,1)= I1(:,:,1);
I(:,:,2)= I1(:,:,2);
I(:,:,3)= I1(:,:,3);

s=size(I);
num_rows= s(1); 
num_cols=s(2);
num_elems = num_rows * num_cols;
K=9;
w=0;

%Convertir a vector la matriz con la imagen
A = I(:);
%Crear un vector para cada color
Red = A(1:num_elems);
Green = A(num_elems+1 : num_elems*2);
Blue = A( (num_elems*2 + 1) : num_elems*3 );

Features = Create_Features(num_elems,num_rows,Red,Blue,Green);
Features_Norm = normalize_matrix(Features,w);
Centroids=init_centroids(Features_Norm, K, num_elems);
Asignacion = KMEANS(Centroids,Features_Norm);
CentroidsDenormalized = DenormalizeCentroids(Centroids,Features);
new_image = Create_New_Image(I, Asignacion, CentroidsDenormalized,num_rows);
NI=uint8(new_image);
figure(1);
imshow(NI);
