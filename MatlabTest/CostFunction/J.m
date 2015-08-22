function j = J(X , y , theta)

	m = size(X,1);

	j = sum(((X*theta) - y).^2)/(2*m);

end;
