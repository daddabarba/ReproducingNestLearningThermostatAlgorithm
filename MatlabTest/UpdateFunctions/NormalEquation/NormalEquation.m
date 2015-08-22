function theta = NormalEquation(X,y)
%Perform the Normal Equation on theta values
	theta = inv(X'*X)*X'*y;

end;
