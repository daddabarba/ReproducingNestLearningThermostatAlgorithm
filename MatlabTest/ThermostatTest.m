addpath('CostFunction/');
addpath('Datas/');
addpath('Values/');
addpath('UpdateFunctions/GradientDescentFunctions/');
addpath('UpdateFunctions/NormalEquation');
addpath('HypoteticalFunction/');


%Initializing the number of iterations and the value of the
%learning rate Alfa
iterations = NumIterations();
alfa = Alfa();

%Loading the training data set.
%Since the algorithm should receive as input the 
%time of the day and give as output the preferred
%temperature these datas will be respectively treated
%as "x" and "y".
x = load('times.txt');
y = load('temperatures.txt');


hold on;

%plotting the training data set.
plot(x,y,"+");

%loading the degree of the hypothetical function.
degree = getDegree();

%Initialize X matrix for multiple features
X = x;

%Since we have only one data, the hour , to have a polynomial
%and so more precise hypothetical function, new features are 
%created. They correspond to an exponentiation
%of the x given (from 2 to "degree")
for i = 2:degree

	X = [X , x.^i];
end;

%now that the X matrix has been created the number
%of features (n) and the number of training examples (m)
%can be initialized
n = size(X,2) + 1;
m = size(X,1);

%Initializing the theta vector
theta = zeros(n,1);

%Normalizing the X matrix datas so that the Gradient
%Descent can run faster 
[Xn , mu , sigma] = featureNormalize(X);

%adding the X(zeros) parameters.
Xn = [ones(length(x),1) , Xn]

%Performing Gradient Descent on the
%Theta parameters
theta = GradientDescent(theta,Xn,y,alfa,iterations);

%Receiving a time as input for the test
in = input("insert a time of the day (use decimal system for the minutes) \n\n");

%Initializing inx for multiple features
inx = in;

%Creating the polynomial feautures
for i = 2:degree

	inx = [inx ;in^i];
end;

%adding the X(zero) parameter.
inx = [1 ; inx];

%Normalizing the input vector
inx(2:length(inx)) = (inx(2:length(inx)) - mu') ./ sigma';

%Calulating the y according to the hypothetical function
h(theta,inx')
