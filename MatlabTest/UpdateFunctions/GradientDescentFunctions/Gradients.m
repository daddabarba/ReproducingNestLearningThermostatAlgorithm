function grad = Gradients(theta , X , y , lambda , m)

	grad = ((((X*theta)-y)'*X)/m)'+ ((lambda/m)*[0 ; theta(2:length(theta))]);

end;
