function theta = GradientDescent(theta , X , y , alpha , n )
%Perform gradient descent on theta values

	lambda = GetLambda();
	
	m = size(X,1);

	for i= 1:n
		delta = Gradients(theta , X , y , lambda , m);
		theta = theta - alpha * delta;

		J(X , y , theta , lambda)
	end;
end;
