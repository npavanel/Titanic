function out = mapFeature(X1, X2, X3, X4, X5)
% MAPFEATURE Feature mapping function to polynomial features
%
%   MAPFEATURE(X1, X2, X3, X4, X5) maps the FIVE input features
%   to dual term features with a specified maximum degree.
%
%   Returns a new feature array with more features, comprising of 
%   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
%
%   Inputs X1, X2, ... must be the same size
%

degree = 3;
features = [X1 X2 X3 X4 X5];
out = ones(size(X1(:,1)));
m = 1;

for n = 1:size(features)(2)
    V1 = features(:,n);

    while m <= size(features)(2)
        if n == 2;
            m = 2;
        elseif n == 3;
            m = 3;
        elseif n == 4;
            m = 4;
        elseif n == 5;
            m = 5;
        end;

        V2 = features(:,m);
        m+=1;

        for i = 1:degree
            for j = 0:i
                out(:, end+1) = (V1.^(i-j)).*(V2.^j);
            end
        end
    end
end

end