function grad = Gradients(theta , X , y , lambda , m)
%Returns the gradients (the partial derivates) of the theta values

	grad = ((((X*theta)-y)'*X)/m)'+ ((lambda/m)*[0 ; theta(2:length(theta))]);

end;
