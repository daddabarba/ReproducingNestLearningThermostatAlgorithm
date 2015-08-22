addpath('CostFunction/');
addpath('Datas/');
addpath('Values/');
addpath('UpdateFunctions/GradientDescentFunctions/');
addpath('UpdateFunctions/NormalEquation');
addpath('HypoteticalFunction/');

iterations = NumIterations();
alfa = Alfa();

x = load('times.txt')
y = load('temperatures.txt')


hold on;

plot(x,y,"+");

degree = 6;

X = [ones(length(x),1) , x];

for i = 2:degree

	X = [X , x.^i];
end;

n = size(X,2);
m = size(X,1);

theta = zeros(n,1);

[Xn , mu , sigma] = featureNormalize(X(:,2:size(X,2)))
Xn = [ones(length(x),1) , Xn]

theta = GradientDescent(theta,Xn,y,alfa,iterations,m);

in = input("say the time of the day \n\n");

inx = in;

for i = 2:degree

	inx = [inx ;in^i];
end;

inx

inx = [1 ; inx];

inx(2:length(inx)) = (inx(2:length(inx)) - mu') ./ sigma';

h(theta,inx)
