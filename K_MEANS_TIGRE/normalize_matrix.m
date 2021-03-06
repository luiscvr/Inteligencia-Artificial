function [Feature_Norm] = normalize_matrix(Features,w)
Feature_Norm=zeros(size(Features));

for i=1 : 5
    Xmax = max(Features(:,i));
    Xmin = min(Features(:,i));
    
    for j=1: size(Features,1)
        X = Features(j,i);
        Feature_Norm(j,i) = (X - Xmin) / (Xmax - Xmin);
    end
end

Feature_Norm(:,1) = Feature_Norm(:,1) * w;
Feature_Norm(:,2) = Feature_Norm(:,2) * w;