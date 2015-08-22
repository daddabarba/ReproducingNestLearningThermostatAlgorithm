function [X_norm , mu , sigma] = featureNormalize(X)

	X_norm = X;   

	n = size(X , 2);

	mu = mean(X);
	sigma = std(X);

	for i = 1:n,
		
		X_norm(:,i) = (X_norm(:,i)-mu(i))/sigma(i);

	end;

end
