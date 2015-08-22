function theta = GradientDescent(theta , X , y , alpha , n )

	lambda = GetLambda();
	
	m = size(X,1);

	for i= 1:n
		delta = Gradients(theta , X , y , lambda , m);
		theta = theta - alpha * delta;

		J(X , y , theta);
	end;
end;
