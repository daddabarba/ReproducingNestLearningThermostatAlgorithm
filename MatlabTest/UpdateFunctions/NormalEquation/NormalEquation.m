function theta = NormalEquation(X,y)

	theta = inv(X'*X)*X'*y;

end;
