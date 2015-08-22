function j = J(X , y , theta)
%the cost function returns the error of 
%the Hypothetical function

	m = size(X,1);

	j = sum(((X*theta) - y).^2)/(2*m)

end;
