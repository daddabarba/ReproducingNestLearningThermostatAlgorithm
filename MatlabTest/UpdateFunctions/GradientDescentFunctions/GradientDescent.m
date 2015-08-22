function theta = GradientDescent(theta , X , y , alpha , n , m)

	lambda = GetLambda();

	for i= 1:n
		delta = ((((X*theta)-y)'*X)/m)'+ ((lambda/m)*[0 ; theta(2:length(theta))]);
		theta = theta - alpha * delta;

		J(X , y , theta)
	end;
end;
